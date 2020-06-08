Class {
	#name : #IceTraitsCherryPickingTest,
	#superclass : #IceCherryPickingTest,
	#category : #'Iceberg-Tests-Cherrypicking'
}

{ #category : #tests }
IceTraitsCherryPickingTest >> testAddTraitDependingInATrait [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createTrait: 'TestTrait'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding a TestTrait'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createTrait: 'TestTrait2'
		inPackage: self packageName1 asSymbol
		with: [ :class | 
			| composition transformations |
			composition := RG2TraitCompositionDefinition parent: class.
			transformations := RG2TraitCompositionVisitor new
				parse: 'TestTrait'
				for: composition.
			class traitComposition: composition.
			transformations do: [ :each | composition addTransformation: each ] ].

	self repository commitWithMessage: 'Adding a trait using a trait'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 2.

	self
		assert:
			(diff / self packageName1 / 'TestTrait2') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestTrait2')
				children size
		equals: 0.

	self
		assert:
			(diff / self packageName1 / 'TestTrait') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestTrait') children
				size
		equals: 0
]

{ #category : #tests }
IceTraitsCherryPickingTest >> testRemoveTraitUsedByAClass [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy
		createClass: 'TestClassUsingTrait'
		inPackage: self packageName1 asSymbol
		with: [ :class | 
			| transformations composition |
			composition := RG2TraitCompositionDefinition parent: class.
			transformations := RG2TraitCompositionVisitor new
				parse: 'TestTraitInitial'
				for: composition.
			class traitComposition: composition.
			transformations do: [ :each | composition addTransformation: each ] ].
		
	self repository
		commitWithMessage: 'Adding a Class using a Trait'.
		
	self repository createBranch: 'b2'.

	self repository workingCopy removeClassNamed: 'TestClassUsingTrait'.
	self repository commitWithMessage: 'Removing TestTraitInitial'.

	self repository workingCopy removeClassNamed: 'TestTraitInitial'.
	self repository commitWithMessage: 'Removing TestSubTrait'.

	commitToCherryPick := self repository head.
	self repository checkoutBranch: 'master'.

	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 2.
	self
		assert: (diff / self packageName1 / 'TestTraitInitial') value isRemoval.
	self
		assert: (diff / self packageName1 / 'TestClassUsingTrait') value isRemoval
]

{ #category : #tests }
IceTraitsCherryPickingTest >> testRemoveTraitUsedByATrait [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy
		createTrait: 'TestSubTrait'
		inPackage: self packageName1 asSymbol
		with: [ :class |
			| transformations composition |
			composition := (RG2TraitCompositionDefinition parent: class).
			transformations := RG2TraitCompositionVisitor new
				parse: 'TestTraitInitial'
				for: composition.

			class traitComposition: composition.

			transformations do: [ :each | composition addTransformation: each ]].
	self repository
		commitWithMessage: 'Adding subTrait of TestTraitInitial'.
	self repository createBranch: 'b2'.

	self repository workingCopy removeClassNamed: 'TestSubTrait'.
	self repository commitWithMessage: 'Removing TestSubTrait'.

	self repository workingCopy removeClassNamed: 'TestTraitInitial'.
	self repository commitWithMessage: 'Removing TestSubTrait'.

	commitToCherryPick := self repository head.
	self repository checkoutBranch: 'master'.

	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 2.
	self assert: (diff / self packageName1 / 'TestTraitInitial') value isRemoval.
	self assert: (diff / self packageName1 / 'TestSubTrait') value isRemoval.
]
