tests
testMergeChangesInDifferentPackagesCausesNoConflicts

	"This is a Ring working copy"
	| initialCommit change1Commit change2Commit |
	repository workingCopy addPackageNamed: packageName1.
	repository workingCopy addPackageNamed: packageName2.
	initialCommit := repository commitWithMessage: 'First commit'.

	repository createBranch: 'change1' inCommit: initialCommit.
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: packageName1 asSymbol.
	change1Commit := repository commitWithMessage: 'Change 1'.

	repository unload.
	repository createBranch: 'change2' inCommit: initialCommit.
	repository head checkout.
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: packageName2 asSymbol.
	change2Commit := repository commitWithMessage: 'Change 2'.
	
	repository unload.
	(repository branchNamed: 'change1') checkout.
	
	repository workingCopy mergeCommit: change2Commit.
	
	self assert: repository headCommit isMergeCommit.
	self assert: (repository headCommit ancestors includes: change1Commit).
	self assert: (repository headCommit ancestors includes: change2Commit).