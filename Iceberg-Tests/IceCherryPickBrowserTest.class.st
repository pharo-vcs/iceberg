Class {
	#name : 'IceCherryPickBrowserTest',
	#superclass : 'IceCherryPickingTest',
	#category : 'Iceberg-Tests-Cherrypicking',
	#package : 'Iceberg-Tests',
	#tag : 'Cherrypicking'
}

{ #category : 'tests' }
IceCherryPickBrowserTest >> testWindowOnMethodConflict [

	| commitToCherryPick presenter |
	self flag: #todo. "Tt's a feature that's not available in menus yet, and it randomly fails on CI."
	self skip.
	
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
	presenter open.
	presenter doCherryPick.
	self assert: 	(self repository workingCopy environment ask classNamed: 'TestClass2')
		methods first sourceCode equals: 'm1 ^42'
]
