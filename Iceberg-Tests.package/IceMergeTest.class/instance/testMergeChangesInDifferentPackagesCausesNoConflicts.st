merge-conflicts
testMergeChangesInDifferentPackagesCausesNoConflicts

	"This is a Ring working copy"
	| initialCommit change1Commit change2Commit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	initialCommit := self repository commitWithMessage: 'First commit'.

	self repository createBranch: 'change1' inCommit: initialCommit.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	change1Commit := self repository commitWithMessage: 'Change 1'.

	self repository unload.
	self repository createBranch: 'change2' inCommit: initialCommit.
	self repository head checkout.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName2 asSymbol.
	change2Commit := self repository commitWithMessage: 'Change 2'.
	
	self repository unload.
	(self repository branchNamed: 'change1') checkout.
	
	self repository workingCopy mergeCommit: change2Commit.
	
	self assert: self repository headCommit isMergeCommit.
	self assert: (self repository headCommit ancestors includes: change1Commit).
	self assert: (self repository headCommit ancestors includes: change2Commit).