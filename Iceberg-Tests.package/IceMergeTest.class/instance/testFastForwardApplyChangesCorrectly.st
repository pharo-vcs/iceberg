merge-conflicts
testFastForwardApplyChangesCorrectly

	"This is a Ring working copy"
	| initialCommit change1Commit newProject |
	newProject := IceBasicProject onRepository: self repository.
	newProject sourceDirectory: 'src'.
	self repository workingCopy project: newProject.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy createClass: 'IceGeneratedClassForTesting' inPackage: self packageName1 asSymbol.
	initialCommit := self repository commitWithMessage: 'First commit'.

	self repository createBranch: 'change1' inCommit: initialCommit.
	self repository workingCopy createClass: 'IceGeneratedClassForTesting2' inPackage: self packageName1 asSymbol.
	change1Commit := self repository commitWithMessage: 'Change 1'.

	self repository unload.
	
	(self repository branchNamed: 'master') checkout.

	self repository workingCopy mergeCommit: change1Commit.
	
	self assert: self repository headCommit equals: change1Commit.
	self assert: (self repository workingCopy environment ask includesClassNamed: #IceGeneratedClassForTesting2)