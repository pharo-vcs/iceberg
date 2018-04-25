merge-operations
testMergeFastForwardClassRemovalIsAppliedToWorkingCopy

	| headCommit mergeCommit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.

	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy removeClassNamed: 'IceGeneratedClassForTesting'.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.

	self repository workingCopy mergeCommit: mergeCommit.
	self denyClassExists: 'IceGeneratedClassForTesting'.