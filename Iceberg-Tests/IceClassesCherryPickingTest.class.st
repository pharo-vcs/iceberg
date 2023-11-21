Class {
	#name : 'IceClassesCherryPickingTest',
	#superclass : 'IceCherryPickingTest',
	#category : 'Iceberg-Tests-Cherrypicking',
	#package : 'Iceberg-Tests',
	#tag : 'Cherrypicking'
}

{ #category : 'tests' }
IceClassesCherryPickingTest >> testAddClassDependingInATrait [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.

	self repository workingCopy
		createTrait: 'TestTrait'
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Adding a TestTrait'.
	self repository workingCopy addPackageNamed: self packageName1.

	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with: [ :class | 
			| composition transformations |
			composition := RGTraitComposition parent: class.
			transformations := RGTraitCompositionVisitor new
				parse: 'TestTrait'
				for: composition.
			class traitComposition: composition.
			transformations do: [ :each | composition addTransformation: each ] ].

	self repository commitWithMessage: 'Adding a class using a trait'.
	commitToCherryPick := fixture repository head.
	self repository checkoutBranch: 'master'.

	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	
	self assert: (diff / self packageName1) children size equals: 4.
	self
		assert: (diff / self packageName1 / 'TestClass2') value isAddition.
	self
		assert: (diff / self packageName1 / 'TestClass2') children size
		equals: 0.
	self
		assert: (diff / self packageName1 / 'TestTrait') value isAddition.
	self
		assert: (diff / self packageName1 / 'TestTrait') children size
		equals: 0
]

{ #category : 'tests' }
IceClassesCherryPickingTest >> testAddClassDependingInATraitWithComposition [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createTrait: 'TestTrait'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding a TestTrait'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with: [ :class | 
			| composition transformations |
			composition := RGTraitComposition parent: class.
			transformations := RGTraitCompositionVisitor new
				parse: 'TestTrait - {#hello. #world}'
				for: composition.

			class traitComposition: composition.

			transformations do: [ :each | composition addTransformation: each ] ].

	self repository commitWithMessage: 'Adding a trait using a trait'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 4.

	self
		assert: (diff / self packageName1 / 'TestClass2') value isAddition.
	self
		assert: (diff / self packageName1 / 'TestClass2') children size
		equals: 0.

	self
		assert: (diff / self packageName1 / 'TestTrait') value isAddition.
	self
		assert: (diff / self packageName1 / 'TestTrait') children size
		equals: 0
]

{ #category : 'tests' }
IceClassesCherryPickingTest >> testAddClassSideMethodInExistingClass [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass'
		isMeta: true.
	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 1.

	self
		assert:
			(diff / self packageName1 / 'TestClass class')
				value isNoModification.

	self
		assert:
			(diff / self packageName1 / 'TestClass class'
				/ 'm1') value isAddition
]

{ #category : 'tests' }
IceClassesCherryPickingTest >> testAddClassUsingASharedPool [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestSharedPool'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #SharedPool) ].
	self repository commitWithMessage: 'Adding a Shared Pool'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with: [ :class | class sharedPools: #(TestSharedPool) ].
	self repository commitWithMessage: 'Adding a class using sharedpools'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 4.

	self
		assert:
			(diff / self packageName1 / 'TestClass2') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass2')
				children size
		equals: 0.

	self
		assert:
			(diff / self packageName1 / 'TestSharedPool')
				value isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestSharedPool')
				children size
		equals: 0
]

{ #category : 'tests' }
IceClassesCherryPickingTest >> testAddClassWithMethod [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass2'.
	self repository commitWithMessage: 'Adding Test Class With a Method'.
	commitToCherryPick := self repository head.
	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 2.
	self
		assert: (diff / self packageName1 / 'TestClass2') value isAddition;
		assert:
			(diff / self packageName1 / 'TestClass2') value definition
				isClassDefinition;
		assert: (diff / self packageName1 / 'TestClass2') children size
			equals: 1;
		assert: (diff / self packageName1 / 'TestClass2' / 'm1') value isAddition
]

{ #category : 'tests' }
IceClassesCherryPickingTest >> testAddClassWithSuperclassAsDependency [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy
		createClass: #A
		inPackage: self packageName1 asSymbol.
	self repository workingCopy
		createClass: #C
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding 2 classes'.

	self repository workingCopy
		createClass: #B
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #A) ].

	self repository commitWithMessage: 'Adding a subclass of A'.
	commitToCherryPick := self repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 4.
	self
		should: [ diff / self packageName1 / 'C' ]
		raise: NotFound.

	self
		assert:
			(diff / self packageName1 / 'A') value definition
				isClassDefinition.
	self
		assert: (diff / self packageName1 / 'A') value isAddition.
	self
		assert: (diff / self packageName1 / 'B') value isAddition.
	self
		assert:
			(diff / self packageName1 / 'B') value definition
				isClassDefinition
]

{ #category : 'tests' }
IceClassesCherryPickingTest >> testAddClassWithoutDependencies [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding Test Class'.
	commitToCherryPick := self repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff  / self packageName1) children size
		equals: 2.
	self
		assert:
			(diff / self packageName1 / 'TestClass2') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass2') value
				definition isClassDefinition
]

{ #category : 'tests' }
IceClassesCherryPickingTest >> testModifyClassWithoutDependencies [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass'
		inPackage: self packageName1 asSymbol
		with: [ :class | class instanceVariables: #(someInstVar) ].
	self repository commitWithMessage: 'Modifying Test Class'.
	commitToCherryPick := self repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].


	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 1.
	self
		assert:
			(diff / self packageName1 / 'TestClass') value
				isModification.
	self
		assert:
			(diff / self packageName1 / 'TestClass') value
				definition isClassDefinition
]

{ #category : 'tests' }
IceClassesCherryPickingTest >> testRemoveClassWithSubclasses [
	| commitToCherryPick diff mergeTree |


	self repository workingCopy
		createClass: 'TestSubclass'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #TestClass) ].
	self repository commitWithMessage: 'Adding subclass of TestClass'.
	
	self repository createBranch: 'b2'.

	self repository workingCopy
		removeClassNamed: 'TestSubclass'.
	self repository commitWithMessage: 'Removing TestSubclass'.
	
	self repository workingCopy
		removeClassNamed: 'TestClass'.
	self repository commitWithMessage: 'Removing TestClass'.
	
	commitToCherryPick := self repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 4.
	self
		assert: (diff / self packageName1 / 'TestClass') value isRemoval.
	self
		assert:
			(diff / self packageName1 / 'TestSubclass') value isRemoval .
]

{ #category : 'tests' }
IceClassesCherryPickingTest >> testRemoveClassWithSubclassesAndIntermediarySubclass [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy
		createClass: 'TestIntermediaryClass'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #TestClass) ].
	self repository workingCopy
		createClass: 'TestSubclass'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #TestIntermediaryClass) ].
	
	self repository commitWithMessage: 'Adding subclasses of TestClass'.

	self repository createBranch: 'b2'.

	self repository workingCopy removeClassNamed: 'TestIntermediaryClass'.
	self repository workingCopy
		createClass: 'TestIntermediaryClass'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #Object) ].
	self repository commitWithMessage: 'Modify Intermediate'.


	self repository workingCopy removeClassNamed: 'TestSubclass'.
	self repository commitWithMessage: 'Removing TestSubclass'.

	self repository workingCopy removeClassNamed: 'TestClass'.
	self repository commitWithMessage: 'Removing TestClass'.

	commitToCherryPick := self repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 4.
	self assert: (diff / self packageName1 / 'TestClass') value isRemoval.
	self
		assert: (diff / self packageName1 / 'TestSubclass') value isRemoval
]
