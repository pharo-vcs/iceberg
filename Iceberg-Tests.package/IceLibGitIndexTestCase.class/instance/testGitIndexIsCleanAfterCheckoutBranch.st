running
testGitIndexIsCleanAfterCheckoutBranch

	"If we checkout a branch, git's index should be clean.
	Otherwise, it may mess up later commits"
	
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository commitWithMessage: 'First commit'.
	
	self repository createBranch: 'to_come_back'.
	
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Change 1'.
	
	(self repository branchNamed: 'master') checkout.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Change 2'.

	(self repository branchNamed: 'to_come_back') checkout.

	self assertIndexIsClean