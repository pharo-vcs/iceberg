merge-operations
testMergeFastForwardClassRemovalIsAppliedToWorkingCopy

	| headCommit mergeCommit |
	repository workingCopy addPackageNamed: self packageName1.
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.

	headCommit := repository commitWithMessage: 'First commit'.

	repository workingCopy removeClassNamed: 'IceGeneratedClassForTesting'.
	mergeCommit := repository commitWithMessage: 'Removal 1'.

	repository branch commit: headCommit.
	repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.

	repository workingCopy mergeCommit: mergeCommit.
	self denyClassExists: 'IceGeneratedClassForTesting'.