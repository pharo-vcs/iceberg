Class {
	#name : #IceMetaClassCherryPickingTest,
	#superclass : #IceCherryPickingTest,
	#category : #'Iceberg-Tests-Cherrypicking'
}

{ #category : #tests }
IceMetaClassCherryPickingTest >> testAddExtensionMethodInMetaSideOfExistingClass [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createMethod: 'm1 ^42'
		extendingClass: 'TestClass class'
		inPackage: self packageName2.
	self repository
		commitWithMessage: 'Adding extension method on MetaSide'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName2) children size equals: 1.

	self
		deny: (diff / self packageName2 / 'TestClass class') value isModification.
	self
		assert: (diff / self packageName2 / 'TestClass class') value isAddition.

	self
		assert: (diff / self packageName2 / 'TestClass class' / 'm1') value isAddition 
]

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
IceMetaClassCherryPickingTest >> testModifyExtensionMethodInMetaSideOfExistingClass [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createMethod: 'm1 ^42'
		extendingClass: 'TestClass class'
		inPackage: self packageName2.
	self repository
		commitWithMessage: 'Adding extension method on MetaSide'.

	self repository createBranch: 'b2'.
	self repository workingCopy
		removeMethod: 'm1'
		extendingClass: 'TestClass class'
		fromPackage: self packageName2.
	self repository workingCopy
		createMethod: 'm1 ^36'
		extendingClass: 'TestClass class'
		inPackage: self packageName2.

	self repository
		commitWithMessage: 'Modifying extension method on MetaSide'.


	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName2) children size equals: 1.

	self
		deny: (diff / self packageName2 / 'TestClass class') value isModification.
	self
		assert: (diff / self packageName2 / 'TestClass class') value isNoModification.

	self
		assert: (diff / self packageName2 / 'TestClass class' / 'm1') value isModification 
]

{ #category : #tests }
IceMetaClassCherryPickingTest >> testModifyMethodInMetaSideOfExistingClass [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass'
		isMeta: true.
	self repository commitWithMessage: 'Adding Method on MetaSide'.

	self repository createBranch: 'b2'.
	self repository workingCopy
		removeMethod: 'm1'
		fromClass: 'TestClass class'.
		
		self repository workingCopy
		createMethod: 'm1 ^36'
		inClass: 'TestClass'
		isMeta: true.

	self repository commitWithMessage: 'Modify Method on MetaSide'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 1.

	self
		deny: (diff / self packageName1 / 'TestClass class') value isModification.
	self
		assert: (diff / self packageName1 / 'TestClass class') value isNoModification .

	self
		assert: (diff / self packageName1 / 'TestClass class' / 'm1') value isModification 
]

{ #category : #tests }
IceMetaClassCherryPickingTest >> testRemoveExtensionMethodInMetaSideOfExistingClass [
	| commitToCherryPick diff mergeTree |

	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createMethod: 'm1 ^42'
		extendingClass: 'TestClass class'
		inPackage: self packageName2.
	self repository
		commitWithMessage: 'Adding extension method on MetaSide'.
	
	self repository createBranch: 'b2'.
	self repository workingCopy
		removeMethod: 'm1'
		extendingClass: 'TestClass class'
		fromPackage: self packageName2.
	self repository
		commitWithMessage: 'Removing extension method on MetaSide'.


	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName2) children size equals: 1.

	self
		deny: (diff / self packageName2 / 'TestClass class') value isModification.
	self
		assert: (diff / self packageName2 / 'TestClass class') value isRemoval .

	self
		assert: (diff / self packageName2 / 'TestClass class' / 'm1') value isRemoval .
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
		removeMethod: 'm1'
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
		assert: (diff / self packageName1 / 'TestClass class') value isRemoval.

	self
		assert: (diff / self packageName1 / 'TestClass class' / 'm1') value isRemoval.
]
