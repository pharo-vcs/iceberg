Class {
	#name : #IceRingWorkingCopy,
	#superclass : #IceWorkingCopy,
	#instVars : [
		'ringEnvironment'
	],
	#category : 'Iceberg-Memory'
}

{ #category : #'private-impacting-changes' }
IceRingWorkingCopy >> applyDefinition: anIceDefinition inNode: aNode [

	| visitor |
	visitor := IceRingWorkingCopyChangerVisitor on: self.
	aNode accept: visitor.
]

{ #category : #packages }
IceRingWorkingCopy >> basicAddPackage: aPackage [
	
	super basicAddPackage: aPackage.
	ringEnvironment ensurePackageNamed: aPackage name.
]

{ #category : #helpers }
IceRingWorkingCopy >> createClass: className inPackage: packageName [
	
	self
		createClass: className
		inPackage: packageName
		with: [ :class | class superclass name: 'Object' ]
]

{ #category : #helpers }
IceRingWorkingCopy >> createClass: className inPackage: packageName with: aBlock [
	
	| package class |
	package := ringEnvironment ensurePackageNamed: packageName.
	class := ringEnvironment ensureClassNamed: className.
	class package: package.
	"class tagWith: packageName."
	
	aBlock value: class.
	
	(self includesPackageNamed: packageName) ifFalse: [ ^ self ].
	self markAsDirtyPackageNamed: package name
]

{ #category : #helpers }
IceRingWorkingCopy >> createMethod: source extendingClass: aClassName inPackage: packageName [
	
	| class method package |
	package := ringEnvironment ensurePackageNamed: packageName.
	class := ringEnvironment ensureClassNamed: aClassName.
	method := class ensureLocalMethodNamed: (RBParser parseMethod: source) selector.
	method protocol: '*', packageName.
	method sourceCode: source.
	method package: method parent package.
	method package: package.
	
	(self includesPackageNamed: packageName) ifFalse: [ ^ self ].
	self markAsDirtyPackageNamed: packageName.
]

{ #category : #helpers }
IceRingWorkingCopy >> createMethod: source inClass: aClassName [
	
	| class method |
	class := ringEnvironment ensureClassNamed: aClassName.
	method := class ensureLocalMethodNamed: (RBParser parseMethod: source) selector.
	method sourceCode: source.
	method package: class package.
	self markAsDirtyPackageNamed: class package name.
]

{ #category : #helpers }
IceRingWorkingCopy >> createTrait: traitName inPackage: packageName [
	
	^ self createTrait: traitName inPackage: packageName with: [ :aTrait |  ]
]

{ #category : #helpers }
IceRingWorkingCopy >> createTrait: traitName inPackage: packageName with: aBlock [
	
	| package class |
	package := ringEnvironment ensurePackageNamed: packageName.
	class := ringEnvironment ensureTraitNamed: traitName.
	class package: package.
	"class tagWith: packageName."
	
	aBlock value: class.
	
	self markAsDirtyPackageNamed: package name
]

{ #category : #accessing }
IceRingWorkingCopy >> environment [
	
	^ ringEnvironment
]

{ #category : #initialization }
IceRingWorkingCopy >> initialize [

	super initialize.
	ringEnvironment := RG2Environment new.
]

{ #category : #packages }
IceRingWorkingCopy >> isLoadedPackageNamed: aString [ 
	
	^ (ringEnvironment ask packageNamed: aString) notNil
]

{ #category : #'private-changes' }
IceRingWorkingCopy >> loadChangesInWorkingCopy: aTree [
	
	| visitor |
	visitor := IceRingWorkingCopyChangerVisitor on: self.
	
	self ignoreNotificationsDuring: [
		aTree accept: visitor.
	]

]

{ #category : #'private-monticello' }
IceRingWorkingCopy >> loadPackagesNamed: packageNames fromCommit: aCommit [
	
	packageNames do: [ :packageName | | package snapshot |
		package := self packageNamed: packageName.
		snapshot := (IceSavedPackageVersion
			fromCommit: aCommit
			package: package)
				mcSnapshot.
		snapshot importInto: ringEnvironment asPackageNamed: packageName.
		package beClean.
	].
	self referenceCommit: aCommit
]

{ #category : #'private-impacting-changes' }
IceRingWorkingCopy >> removeClassNamed: aString [ 
	
	| class |
	class := ringEnvironment ask classNamed: aString.
	class ifNil: [ ^ self ].
	
	ringEnvironment removeBehavior: class.
	self markAsDirtyPackageNamed: class package name.
]

{ #category : #'private-impacting changes' }
IceRingWorkingCopy >> removeMethod: anIceMethodDefinition [ 
	
	self
		removeMethod: anIceMethodDefinition selector
		fromClass: anIceMethodDefinition ownerName
]

{ #category : #helpers }
IceRingWorkingCopy >> removeMethod: selector extendingClass: aClassName fromPackage: aPackageName [

	| method class |
	class := ringEnvironment ensureClassNamed: aClassName.
	method := class ask methodNamed: selector.
	class removeLocalMethod: method.
	self markAsDirtyPackageNamed: aPackageName.
]

{ #category : #helpers }
IceRingWorkingCopy >> removeMethod: selector fromClass: aClassName [

	| class method |
	class := ringEnvironment ensureClassNamed: aClassName.
	method := class localMethodNamed: selector ifAbsent: [ ^ self ].
	class removeLocalMethod: method.
	self markAsDirtyPackageNamed: class package name.
]

{ #category : #actions }
IceRingWorkingCopy >> snapshotForPackage: aPackage [

	^ (ringEnvironment ensurePackageNamed: aPackage name) asMCSnapshot.
]

{ #category : #'private-monticello' }
IceRingWorkingCopy >> unloadPackage: aPackage [

	| package |
	package := ringEnvironment ask packageNamed: aPackage name.
	package ifNil: [ ^ self ].
	
	ringEnvironment removePackage: package.
	package classes do: [ :each | ringEnvironment removeBehavior: each ]
]
