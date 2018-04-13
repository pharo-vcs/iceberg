running
testGitIndexIsCleanAfterCheckoutBranch

	"If we checkout a branch, git's index should be clean.
	Otherwise, it may mess up later commits"
	
	repository workingCopy addPackageNamed: self packageName1.
	repository workingCopy addPackageNamed: self packageName2.
	repository commitWithMessage: 'First commit'.
	
	repository createBranch: 'to_come_back'.
	
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	repository commitWithMessage: 'Change 1'.
	
	(repository branchNamed: 'master') checkout.
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.
	repository commitWithMessage: 'Change 2'.

	(repository branchNamed: 'to_come_back') checkout.

	self assertIndexIsClean