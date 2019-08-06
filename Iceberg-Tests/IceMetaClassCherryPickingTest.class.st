Class {
	#name : #IceMetaClassCherryPickingTest,
	#superclass : #IceCherryPickingTest,
	#category : #'Iceberg-Tests-Cherrypicking'
}

{ #category : #tests }
IceMetaClassCherryPickingTest >> testAddMethodInMetaSideOfExistingClass [

	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass'
		isMeta: true.

	self repository commitWithMessage: 'Adding Method on MetaSide'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 1.

	self
		deny: (diff / self packageName1 / 'TestClass class') value isModification.
	self assert: (diff / self packageName1 / 'TestClass class') value isAddition.

	self
		assert: (diff / self packageName1 / 'TestClass class' / 'm1') value isAddition
]

{ #category : #tests }
IceMetaClassCherryPickingTest >> testRemoveMethodInMetaSideOfExistingClass [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass'
		isMeta: true.
	self repository commitWithMessage: 'Adding Method on MetaSide'.

	self repository createBranch: 'b2'.
	self repository workingCopy
		removeMethod: 'm1 ^42'
		fromClass: 'TestClass class'.
	self repository commitWithMessage: 'Remove Method on MetaSide'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 1.

	self
		deny: (diff / self packageName1 / 'TestClass class') value isModification.
	self
		assert: (diff / self packageName1 / 'TestClass class') value isAddition.

	self
		assert: (diff / self packageName1 / 'TestClass class' / 'm1') value isAddition
]
