merge-conflicts
testMergeChangesInSameClassesSamePackageCausesConflicts

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
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class superclass name: 'ASuperclass' ].
	change1Commit := self repository commitWithMessage: 'Change 1'.

	self repository unload.
	self repository createBranch: 'change2' inCommit: initialCommit.
	self repository head checkout.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class superclass name: 'ADifferentSuperclass' ].
	change2Commit := self repository commitWithMessage: 'Change 2'.
	
	(self repository branchNamed: 'change1') checkout.
	self should: [self repository workingCopy mergeCommit: change2Commit] raise: IceMergeResolutionRequest