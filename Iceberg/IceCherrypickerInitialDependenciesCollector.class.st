"
I am a visitor of IceDiff (and IceDefinition) collect the initial ser of dependencies in an instance of IceCherrypicker.

"
Class {
	#name : 'IceCherrypickerInitialDependenciesCollector',
	#superclass : 'IceTreeVisitor',
	#instVars : [
		'cherrypicker'
	],
	#category : 'Iceberg-Cherrypicking',
	#package : 'Iceberg',
	#tag : 'Cherrypicking'
}

{ #category : 'accessing' }
IceCherrypickerInitialDependenciesCollector >> cherrypicker [
	^ cherrypicker
]

{ #category : 'accessing' }
IceCherrypickerInitialDependenciesCollector >> cherrypicker: anIceCherrypicker [

	cherrypicker := anIceCherrypicker
]

{ #category : 'visiting' }
IceCherrypickerInitialDependenciesCollector >> visitAddition: anIceAddition [
	anIceAddition definition accept: self.
		self visitChildrenOf: currentNode
]

{ #category : 'visiting' }
IceCherrypickerInitialDependenciesCollector >> visitClassDefinition: anIceClassDefinition [
	anIceClassDefinition isMeta
		ifTrue: [ cherrypicker
				addMetaclassDependency: anIceClassDefinition ]
		ifFalse: [ cherrypicker addClassDependencyOf: anIceClassDefinition ]
]

{ #category : 'accessing' }
IceCherrypickerInitialDependenciesCollector >> visitExtensionDefinition: anIceExtensionDefinition [
cherrypicker addExtendedClassDependency: anIceExtensionDefinition
]

{ #category : 'visiting' }
IceCherrypickerInitialDependenciesCollector >> visitMethodNode: anIceMethodDefinition [
	cherrypicker
		addMethodDependencyOf: anIceMethodDefinition
]

{ #category : 'visiting' }
IceCherrypickerInitialDependenciesCollector >> visitModification: anIceModification [
	anIceModification definition accept: self.
		self visitChildrenOf: currentNode
]

{ #category : 'visiting' }
IceCherrypickerInitialDependenciesCollector >> visitNoModification: anIceNoModification [ 
	
	"Nothing with me. Just visit children"
	self visitChildrenOf: currentNode.
]

{ #category : 'visiting' }
IceCherrypickerInitialDependenciesCollector >> visitPackage: anIcePackageDefinition [
	cherrypicker
		addPackageDependency: anIcePackageDefinition
]

{ #category : 'visiting' }
IceCherrypickerInitialDependenciesCollector >> visitRemoval: anIceRemoval [
	anIceRemoval definition accept: self.
		self visitChildrenOf: currentNode
]

{ #category : 'visiting' }
IceCherrypickerInitialDependenciesCollector >> visitTraitDefinition: anIceTraitDefinition [
	cherrypicker
		addTraitDependencyOf: anIceTraitDefinition
]
