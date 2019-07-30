Class {
	#name : #IceCherryPickBrowserTest,
	#superclass : #IceCherryPickingTest,
	#category : #'Iceberg-Tests-Cherrypicking'
}

{ #category : #tests }
IceCherryPickBrowserTest >> testWindowOnMethodConflict [
	| commitToCherryPick presenter |
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
	presenter := IceTipCherrypickPreviewBrowser
		onCommitish: commitToCherryPick.
	presenter openWithSpec.
	presenter doCherryPick.
	self assert: 	(self repository workingCopy environment ask classNamed: 'TestClass2')
		methods first sourceCode equals: 'm1 ^42'
]
