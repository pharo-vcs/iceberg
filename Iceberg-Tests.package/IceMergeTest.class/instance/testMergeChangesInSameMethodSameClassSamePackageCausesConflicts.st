tests
testMergeChangesInSameMethodSameClassSamePackageCausesConflicts

	"This is a Ring working copy"
	| initialCommit change1Commit change2Commit |
	repository workingCopy addPackageNamed: packageName1.
	repository workingCopy addPackageNamed: packageName2.
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: packageName1 asSymbol.
	repository workingCopy
		createMethod: 'test ^ 1' inClass: 'IceGeneratedClassForTesting' asSymbol.
	initialCommit := repository commitWithMessage: 'First commit'.

	repository createBranch: 'change1' inCommit: initialCommit.
	repository workingCopy
		createMethod: 'test ^ 2' inClass: 'IceGeneratedClassForTesting' asSymbol.
	change1Commit := repository commitWithMessage: 'Change 1'.

	repository unload.
	repository createBranch: 'change2' inCommit: initialCommit.
	repository head checkout.
	repository workingCopy
		createMethod: 'test ^ 3' inClass: 'IceGeneratedClassForTesting' asSymbol.
	change2Commit := repository commitWithMessage: 'Change 2'.
	
	(repository branchNamed: 'change1') checkout.
	self should: [repository workingCopy mergeCommit: change2Commit] raise: MCMergeResolutionRequest