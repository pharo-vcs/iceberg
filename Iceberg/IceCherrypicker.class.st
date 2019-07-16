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
		'targetDiff'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #convenience }
IceCherrypicker class >> executeFrom: initialDiff to: extendedDiff [

	self new
		sourceDiff: initialDiff;
		targetDiff: extendedDiff;
		execute
]

{ #category : #dependencies }
IceCherrypicker >> addClassDependencyOf: aMCClassDefinition [
	
	dependencies add: (IceClassDependency new
				definition: aMCClassDefinition;
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
IceCherrypicker >> addMethodDependencyOf: aMCMethodDefinition [ 
	
	dependencies add: (IceMethodDependency new
				definition: aMCMethodDefinition;
				yourself)
]

{ #category : #dependencies }
IceCherrypicker >> addPackageDependencyOfPackageNamed: aString [

	dependencies add: (IcePackageDependency new
				name: aString;
				yourself)
]

{ #category : #dependencies }
IceCherrypicker >> addTraitDependencyOf: aMCTraitDefinition [
	
	dependencies add: (IceTraitDependency new
				definition: aMCTraitDefinition;
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

{ #category : #'execution - private' }
IceCherrypicker >> pruneUndependedNodesInTargetDiff [

	IceCherrypickerDiffPruner new
		cherrypicker: self;
		applyTo: targetDiff
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
