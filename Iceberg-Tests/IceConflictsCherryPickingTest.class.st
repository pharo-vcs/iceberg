Class {
	#name : #IceConflictsCherryPickingTest,
	#superclass : #IceCherryPickingTest,
	#category : #'Iceberg-Tests-Cherrypicking'
}

{ #category : #tests }
IceConflictsCherryPickingTest >> testAddPackageConflict [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createClass: 'TestClass'
		inPackage: self packageName2 asSymbol.
	self repository commitWithMessage: 'Adding the package'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createClass: 'TestClass'
		inPackage: self packageName2 asSymbol.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding the package a second time'.

	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		deny: (mergeTree  / self packageName2) value isConflict
]

{ #category : #tests }
IceConflictsCherryPickingTest >> testMethodModificationConflict [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding test class'.


	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass2'.
	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.


	self repository checkoutBranch: 'master'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^36'
		inClass: 'TestClass2'.
	self repository commitWithMessage: 'Adding the same method in master'.

	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: mergeTree children size equals: 1.
	self
		assert: (mergeTree  / self packageName1) children size
		equals: 1.

	self
		assert:
			(mergeTree  / self packageName1 / 'TestClass2')  value chosenOperation 
				isNoModification.
	self
		assert:
			(mergeTree  / self packageName1 / 'TestClass2')
				children size
		equals: 1.
	self
		assert:
			(mergeTree / self packageName1 / 'TestClass2' / 'm1')
				value isConflict
]
