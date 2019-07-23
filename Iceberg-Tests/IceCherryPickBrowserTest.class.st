Class {
	#name : #IceCherryPickBrowserTest,
	#superclass : #IceCherryPickingTest,
	#category : #'Iceberg-Tests-Cherrypicking'
}

{ #category : #tests }
IceCherryPickBrowserTest >> testWindowOnMethodConflict [
	| commitToCherryPick diff mergeTree model presenter |
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

	presenter := IceTipCherrypickPreviewBrowser onMergeTree: mergeTree.
	presenter openWithSpec.
	1 halt.
]
