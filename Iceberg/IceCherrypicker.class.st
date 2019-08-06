"
I know how to cherry-pick changes from a source IceDiff into a target IceDiff. 

* The source diff is an ""initial change set"" (ICS) with changes we want to initially selected.
* The target diff is an ""estimated transitive change set"" (ETCS) is the universe of changes, some of them will be pruned if they are not required by the changes in the ICS.

"
Class {
	#name : #IceCherrypicker,
	#superclass : #Object,
	#instVars : [
		'dependencies',
		'sourceDiff',
		'targetDiff',
		'receiverToAncestorDiff',
		'mergeTree'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #dependencies }
IceCherrypicker >> addClassDependencyOf: aIceClassDefinition [
	dependencies
		add:
			(IceClassDependency new
				definition: aIceClassDefinition;
				yourself)
]

{ #category : #'access options' }
IceCherrypicker >> addDependency: anIceDependency [ 
	self dependencies add: anIceDependency .
]

{ #category : #dependencies }
IceCherrypicker >> addExtendedClassDependency: aIceExtensionDefinition [
	dependencies
		add:
			(IceExtendedClassDependency new
				definition: aIceExtensionDefinition;
				yourself)
]

{ #category : #'execution - private' }
IceCherrypicker >> addInitialDependencies [

	sourceDiff accept: (IceCherrypickerInitialDependenciesCollector new
				cherrypicker: self;
				yourself)
]

{ #category : #dependencies }
IceCherrypicker >> addMetaclassDependencyToClassNamed: aSymbol [
	
	dependencies add: (IceMetaclassDependency new
				name: aSymbol;
				yourself)
]

{ #category : #dependencies }
IceCherrypicker >> addMethodDependencyOf: aIceMethodDefinition [ 
	
	dependencies add: (IceMethodDependency new
				definition: aIceMethodDefinition;
				yourself)
]

{ #category : #dependencies }
IceCherrypicker >> addPackageDependencyOfPackageNamed: aIcePackageDefinition [

	dependencies add: (IcePackageDependency new
				definition: aIcePackageDefinition;
				yourself)
]

{ #category : #dependencies }
IceCherrypicker >> addTraitDependencyOf: aIceTraitDefinition [
	dependencies
		add:
			(IceTraitDependency new
				definition: aIceTraitDefinition;
				yourself)
]

{ #category : #'execution - private' }
IceCherrypicker >> addTransitiveDependencies [

	| originalDependencies |
	originalDependencies := nil.
	
	[ 	originalDependencies ~= dependencies ] whileTrue: [
		originalDependencies := dependencies copy.
		originalDependencies do: [ :each |
			each addTransitiveDependenciesFrom: targetDiff to: self ] ]
]

{ #category : #accessing }
IceCherrypicker >> dependencies [
	^ dependencies
]

{ #category : #'execution - public' }
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

{ #category : #testing }
IceCherrypicker >> includesDependencyTo: aDefinition [

	^ dependencies anySatisfy: [ :each | each isDependencyTo: aDefinition ]. 
]

{ #category : #initialization }
IceCherrypicker >> initialize [

	super initialize.
	dependencies := Set new
]

{ #category : #operations }
IceCherrypicker >> mergeWithCurrentBranch [
	mergeTree  := IceTreeMerger new
		merge: self targetDiff tree
		into: self receiverToAncestorDiff tree
]

{ #category : #'execution - private' }
IceCherrypicker >> pruneUndependedNodesInTargetDiff [

	IceCherrypickerDiffPruner new
		cherrypicker: self;
		applyTo: targetDiff
]

{ #category : #accessing }
IceCherrypicker >> receiverToAncestorDiff [
	^ receiverToAncestorDiff
]

{ #category : #accessing }
IceCherrypicker >> receiverToAncestorDiff: anIceDiff [ 
	receiverToAncestorDiff:= anIceDiff.
]

{ #category : #accessing }
IceCherrypicker >> sourceDiff [
	^ sourceDiff
]

{ #category : #accessing }
IceCherrypicker >> sourceDiff: anObject [
	sourceDiff := anObject
]

{ #category : #accessing }
IceCherrypicker >> targetDiff [
	^ targetDiff
]

{ #category : #accessing }
IceCherrypicker >> targetDiff: anObject [
	targetDiff := anObject
]
