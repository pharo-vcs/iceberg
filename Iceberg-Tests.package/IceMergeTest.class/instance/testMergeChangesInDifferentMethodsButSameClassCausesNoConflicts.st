merge-conflicts
testMergeChangesInDifferentMethodsButSameClassCausesNoConflicts

	"This is a Ring working copy"
	| initialCommit change1Commit change2Commit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	initialCommit := self repository commitWithMessage: 'First commit'.

	self repository createBranch: 'change1' inCommit: initialCommit.
	self repository workingCopy
		createMethod: 'test ^ 1' inClass: 'IceGeneratedClassForTesting' asSymbol.
	change1Commit := self repository commitWithMessage: 'Change 1'.

	self repository unload.
	self repository createBranch: 'change2' inCommit: initialCommit.
	self repository head checkout: IceCheckoutAllPackages new.
	self repository workingCopy
		createMethod: 'test2 ^ 2' inClass: 'IceGeneratedClassForTesting' asSymbol.
	change2Commit := self repository commitWithMessage: 'Change 2'.
	
	(self repository branchNamed: 'change1') checkout.
	
	self repository workingCopy mergeCommit: change2Commit.
	
	self assert: self repository headCommit isMergeCommit.
	self assert: (self repository headCommit ancestors includes: change1Commit).
	self assert: (self repository headCommit ancestors includes: change2Commit).