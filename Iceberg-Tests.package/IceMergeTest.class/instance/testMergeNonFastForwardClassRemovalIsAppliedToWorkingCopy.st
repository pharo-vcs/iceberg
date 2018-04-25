merge-operations
testMergeNonFastForwardClassRemovalIsAppliedToWorkingCopy

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
	
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.

	repository commitWithMessage: 'Other commit'.

	repository workingCopy mergeCommit: mergeCommit.

	self assertClassExists: 'IceGeneratedClassForTesting2'.
	self denyClassExists: 'IceGeneratedClassForTesting'.