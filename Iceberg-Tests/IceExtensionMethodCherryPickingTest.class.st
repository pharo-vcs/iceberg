Class {
	#name : 'IceExtensionMethodCherryPickingTest',
	#superclass : 'IceCherryPickingTest',
	#category : 'Iceberg-Tests-Cherrypicking',
	#package : 'Iceberg-Tests',
	#tag : 'Cherrypicking'
}

{ #category : 'tests' }
IceExtensionMethodCherryPickingTest >> testAddExtensionMethodInExistingClass [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createMethod: 'm1 ^42'
		extendingClass: 'TestClass'
		inPackage: self packageName2.
	self repository commitWithMessage: 'Adding extension method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName2) children size
		equals: 1.
	self
		assert:
			(diff / self packageName2 / 'TestClass') value
				isAddition.
	self
		assert:
			(diff / self packageName2 / 'TestClass' / 'm1')
				value isAddition
]

{ #category : 'tests' }
IceExtensionMethodCherryPickingTest >> testAddExtensionMethodInExistingTrait [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createMethod: 'm1 ^42'
		extendingClass: 'TestTraitInitial'
		inPackage: self packageName2.

	self repository commitWithMessage: 'Adding extension method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName2) children size
		equals: 1.
	self
		assert:
			(diff / self packageName2 / 'TestTraitInitial')
				value isAddition.
	self
		assert:
			(diff / self packageName2 / 'TestTraitInitial'
				/ 'm1') value isAddition
]

{ #category : 'tests' }
IceExtensionMethodCherryPickingTest >> testAddTwoExtensionMethodsInExistingClass [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createMethod: 'm1 ^42'
		extendingClass: 'TestClass'
		inPackage: self packageName2.
	self repository workingCopy
		createMethod: 'm2 ^36'
		extendingClass: 'TestClass'
		inPackage: self packageName2.

	self repository commitWithMessage: 'Adding extension methods'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName2) children size equals: 1.
	self
		assert: (diff / self packageName2 / 'TestClass') value isAddition;
		assert: (diff / self packageName2 / 'TestClass') children size equals: 2.
	self
		assert: (diff / self packageName2 / 'TestClass' / 'm1') value isAddition;
		assert: (diff / self packageName2 / 'TestClass' / 'm2') value isAddition
]

{ #category : 'tests' }
IceExtensionMethodCherryPickingTest >> testAddTwoExtensionMethodsInExistingClasses [
	| commitToCherryPick diff mergeTree |

	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1.
	self repository commitWithMessage: 'Add a second Class TestClass2'.
	self repository createBranch: 'b2'.

	self repository workingCopy
		createMethod: 'm1 ^42'
		extendingClass: 'TestClass'
		inPackage: self packageName2.

	self repository workingCopy
		createMethod: 'm2 ^36'
		extendingClass: 'TestClass2'
		inPackage: self packageName2.

	self repository commitWithMessage: 'Adding extension methods'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName2) children size equals: 2.
	self
		assert: (diff / self packageName2 / 'TestClass') value isAddition;
		assert: (diff / self packageName2 / 'TestClass') children size equals: 1 .
		self
		assert: (diff / self packageName2 / 'TestClass2') value isAddition;
		assert: (diff / self packageName2 / 'TestClass2') children size equals: 1 .
	self
		assert: (diff / self packageName2 / 'TestClass' / 'm1') value isAddition;
		assert: (diff / self packageName2 / 'TestClass2' / 'm2') value isAddition
]

{ #category : 'tests' }
IceExtensionMethodCherryPickingTest >> testAddTwoExtensionMethodsInNonExistingClasses [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy addPackageNamed: self packageName2.

	self repository createBranch: 'b2'.

	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1.
	self repository commitWithMessage: 'Add a second Class TestClass2'.


	self repository workingCopy
		createMethod: 'm1 ^42'
		extendingClass: 'TestClass'
		inPackage: self packageName2.

	self repository workingCopy
		createMethod: 'm2 ^36'
		extendingClass: 'TestClass2'
		inPackage: self packageName2.

	self repository commitWithMessage: 'Adding extension methods'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 2.
	self assert: (diff / self packageName1) children size equals: 2.
	self
		assert: (diff / self packageName1 / 'TestClass2') value isAddition;
		assert: (diff / self packageName1 / 'TestClass2') children size
			equals: 0.

	self assert: (diff / self packageName2) children size equals: 2.
	self
		assert: (diff / self packageName2 / 'TestClass') value isAddition;
		assert: (diff / self packageName2 / 'TestClass') children size
			equals: 1.
	self
		assert: (diff / self packageName2 / 'TestClass2') value isAddition;
		assert: (diff / self packageName2 / 'TestClass2') children size
			equals: 1.
	self
		assert: (diff / self packageName2 / 'TestClass' / 'm1') value isAddition;
		assert: (diff / self packageName2 / 'TestClass2' / 'm2') value isAddition.
]

{ #category : 'tests' }
IceExtensionMethodCherryPickingTest >> testModifyExtensionMethodInExistingClass [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createMethod: 'm1 ^42'
		extendingClass: 'TestClass'
		inPackage: self packageName2.
	self repository commitWithMessage: 'Adding extension method'.

	self repository createBranch: 'b2'.
	self repository workingCopy
		removeMethod: 'm1'
		extendingClass: 'TestClass'
		fromPackage: self packageName2.
	self repository workingCopy
			createMethod: 'm1 ^36'
		extendingClass: 'TestClass'
		inPackage: self packageName2.
	self repository commitWithMessage: 'Modify extension method'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.

	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName2) children size equals: 1.
	self assert: (diff / self packageName2 / 'TestClass') value isNoModification.
	self
		assert: (diff / self packageName2 / 'TestClass' / 'm1') value isModification.
]

{ #category : 'tests' }
IceExtensionMethodCherryPickingTest >> testRemoveExtensionMethodInExistingClass [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createMethod: 'm1 ^42'
		extendingClass: 'TestClass'
		inPackage: self packageName2.
	self repository commitWithMessage: 'Adding extension method'.

	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		removeMethod: 'm1'
		extendingClass: 'TestClass'
		fromPackage: self packageName2.
	self repository commitWithMessage: 'Remove extension method'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.

	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName2) children size equals: 1.
	
	self assert: (diff / self packageName2 / 'TestClass') value isRemoval.
	self
		assert: (diff / self packageName2 / 'TestClass' / 'm1') value isRemoval
]
