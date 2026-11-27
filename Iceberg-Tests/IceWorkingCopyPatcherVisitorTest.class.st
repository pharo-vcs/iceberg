"
I test how IceWorkingCopyPatcherVisitor applies changes to the code loaded in the image.

Unlike most Iceberg tests, I do not use a Ring working copy but the real one (IceWorkingCopy), since I check the interaction with the code of the image. I create my mock packages in the image and remove them at the end of each test.
"
Class {
	#name : 'IceWorkingCopyPatcherVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'repository'
	],
	#category : 'Iceberg-Tests-Changes',
	#package : 'Iceberg-Tests',
	#tag : 'Changes'
}

{ #category : 'accessing' }
IceWorkingCopyPatcherVisitorTest >> extendedPackageName [

	^ 'IcebergMockExtendedPackage'
]

{ #category : 'accessing' }
IceWorkingCopyPatcherVisitorTest >> removedPackageName [

	^ 'IcebergMockRemovedPackage'
]

{ #category : 'running' }
IceWorkingCopyPatcherVisitorTest >> setUp [

	super setUp.
	repository := IceMemoryRepository new.
	repository workingCopy: (IceWorkingCopy repository: repository)
]

{ #category : 'running' }
IceWorkingCopyPatcherVisitorTest >> tearDown [

	{ self removedPackageName. self extendedPackageName } do: [ :packageName | self packageOrganizer removePackage: packageName ].
	super tearDown
]

{ #category : 'tests' }
IceWorkingCopyPatcherVisitorTest >> testRemovePackageWithExtensionMethod [
	"Unloading the package already removes its extension methods. Removing them a second time used to fail because the method was not found."

	| extendedClass extensionProtocol packageNode extensionNode |
	extendedClass := self class classInstaller make: [ :builder |
			                 builder
				                 name: #IcebergMockExtendedClass;
				                 package: self extendedPackageName ].
	extensionProtocol := '*' , self removedPackageName.
	extendedClass compile: 'extensionMethod ^ 42' classified: extensionProtocol.

	packageNode := IceNode value: (IceRemoval definition: (IcePackageDefinition named: self removedPackageName)).
	extensionNode := packageNode addChild: (IceRemoval definition: (IceExtensionDefinition named: extendedClass name isMeta: false packageName: self removedPackageName)).
	extensionNode addChild: (IceRemoval definition: (IceMethodDefinition
				  className: extendedClass name
				  classIsMeta: false
				  protocol: extensionProtocol
				  name: #extensionMethod
				  sourceCode: 'extensionMethod ^ 42')).

	packageNode accept: (IceWorkingCopyPatcherVisitor on: repository).

	self deny: (extendedClass includesSelector: #extensionMethod).
	self deny: (self packageOrganizer hasPackage: self removedPackageName).
	self assert: (self packageOrganizer hasPackage: self extendedPackageName)
]
