"
I know how to cherry-pick changes from a source IceDiff into a target IceDiff. 

* The source diff is an ""initial change set"" (ICS) with changes we want to initially selected.
* The target diff is an ""estimated transitive change set"" (ETCS) is the universe of changes, some of them will be pruned if they are not required by the changes in the ICS.

"
Class {
	#name : 'IceCherrypicker',
	#superclass : 'Object',
	#instVars : [
		'dependencies',
		'sourceDiff',
		'receiverToAncestorDiff',
		'mergeTree',
		'incomingChangesDiff',
		'environment'
	],
	#category : 'Iceberg-Cherrypicking',
	#package : 'Iceberg',
	#tag : 'Cherrypicking'
}

{ #category : 'dependencies' }
IceCherrypicker >> addClassDependencyOf: aIceClassDefinition [
	dependencies
		add:
			(IceClassDependency new
				definition: aIceClassDefinition;
								cherrypicker: self;
				yourself)
]

{ #category : 'accessing - options' }
IceCherrypicker >> addDependency: anIceDependency [ 
	self dependencies add: anIceDependency .
]

{ #category : 'dependencies' }
IceCherrypicker >> addExtendedClassDependency: aIceExtensionDefinition [
	dependencies
		add:
			(IceExtendedClassDependency new
				definition: aIceExtensionDefinition;
				cherrypicker: self;
				yourself)
]

{ #category : 'execution - private' }
IceCherrypicker >> addInitialDependencies [

	sourceDiff accept: (IceCherrypickerInitialDependenciesCollector new
				cherrypicker: self;
				yourself)
]

{ #category : 'dependencies' }
IceCherrypicker >> addMetaclassDependency: anIceClassDefinition [
	dependencies
		add:
			(IceMetaclassDependency new
				definition: anIceClassDefinition;
				cherrypicker: self;
				yourself)
]

{ #category : 'dependencies' }
IceCherrypicker >> addMethodDependencyOf: aIceMethodDefinition [
	dependencies
		add:
			(IceMethodDependency new
				definition: aIceMethodDefinition;
				cherrypicker: self;
				yourself)
]

{ #category : 'dependencies' }
IceCherrypicker >> addPackageDependency: aIcePackageDefinition [
	dependencies
		add:
			(IcePackageDependency new
				definition: aIcePackageDefinition;
								cherrypicker: self;
				yourself)
]

{ #category : 'dependencies' }
IceCherrypicker >> addTraitDependencyOf: aIceTraitDefinition [
	dependencies
		add:
			(IceTraitDependency new
				definition: aIceTraitDefinition;
								cherrypicker: self;
				yourself)
]

{ #category : 'execution - private' }
IceCherrypicker >> addTransitiveDependencies [
	| originalDependencies |
	originalDependencies := nil.

	[ originalDependencies ~= dependencies ]
		whileTrue: [ originalDependencies := dependencies copy.
			originalDependencies
				do: [ :each | each addTransitiveDependenciesFrom: incomingChangesDiff to: self ]]
]

{ #category : 'accessing' }
IceCherrypicker >> dependencies [
	^ dependencies
]

{ #category : 'accessing' }
IceCherrypicker >> environment [
	^ environment ifNil: [ environment := IceDependencyEnvironment on: receiverToAncestorDiff targetVersion  ]
]

{ #category : 'accessing' }
IceCherrypicker >> environment: anObject [
	environment:= anObject 
]

{ #category : 'execution - public' }
IceCherrypicker >> execute [
	"Obtain the initial change set (ICS)"

	self addInitialDependencies.

	"Obtain an estimated transitive change set (ETCS)"
	self addTransitiveDependencies.

	"Transform the diff to hold the ETCS"
	self pruneUndependedNodesInTargetDiff.

	"Merge changes into the current branch."
	self mergeWithCurrentBranch.
	^ mergeTree
]

{ #category : 'testing' }
IceCherrypicker >> includesDependencyTo: aDefinition [

	^ dependencies anySatisfy: [ :each | each isDependencyTo: aDefinition ]. 
]

{ #category : 'initialization' }
IceCherrypicker >> initialize [

	super initialize.
	dependencies := Set new
]

{ #category : 'operations' }
IceCherrypicker >> mergeWithCurrentBranch [
	mergeTree  := IceTreeMerger new
		merge: self targetDiff tree
		into: self receiverToAncestorDiff tree
]

{ #category : 'execution - private' }
IceCherrypicker >> pruneUndependedNodesInTargetDiff [

	IceCherrypickerDiffPruner new
		cherrypicker: self;
		applyTo: incomingChangesDiff
]

{ #category : 'accessing' }
IceCherrypicker >> receiverToAncestorDiff [
	^ receiverToAncestorDiff
]

{ #category : 'accessing' }
IceCherrypicker >> receiverToAncestorDiff: anIceDiff [ 
	receiverToAncestorDiff:= anIceDiff.
]

{ #category : 'accessing' }
IceCherrypicker >> sourceDiff [
	^ sourceDiff
]

{ #category : 'accessing' }
IceCherrypicker >> sourceDiff: anObject [
	sourceDiff := anObject
]

{ #category : 'accessing' }
IceCherrypicker >> targetDiff [
	^ incomingChangesDiff
]

{ #category : 'accessing' }
IceCherrypicker >> targetDiff: anObject [
	incomingChangesDiff := anObject
]
