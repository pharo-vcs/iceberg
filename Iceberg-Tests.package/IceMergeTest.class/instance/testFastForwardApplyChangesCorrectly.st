tests
testFastForwardApplyChangesCorrectly

	"This is a Ring working copy"
	| initialCommit change1Commit |
	
	repository subdirectory: 'src'.
	repository workingCopy addPackageNamed: self packageName1.
	repository workingCopy createClass: 'IceGeneratedClassForTesting' inPackage: self packageName1 asSymbol.
	initialCommit := repository commitWithMessage: 'First commit'.

	repository createBranch: 'change1' inCommit: initialCommit.
	repository workingCopy createClass: 'IceGeneratedClassForTesting2' inPackage: self packageName1 asSymbol.
	change1Commit := repository commitWithMessage: 'Change 1'.

	repository unload.
	
	(repository branchNamed: 'master') checkout.

	repository workingCopy mergeCommit: change1Commit.
	
	self assert: repository headCommit equals: change1Commit.
	self assert: (repository workingCopy environment ask includesClassNamed: #IceGeneratedClassForTesting2)