merge-operations
testMergeNonFastForwardMethodRemovalIsAppliedToWorkingCopy

	| headCommit mergeCommit |
	repository workingCopy addPackageNamed: self packageName1.
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol;
		createMethod: 'm ^ 42' inClass: 'IceGeneratedClassForTesting'.

	headCommit := repository commitWithMessage: 'First commit'.

	repository workingCopy removeMethod: #m fromClass:  'IceGeneratedClassForTesting'.
	mergeCommit := repository commitWithMessage: 'Removal 1'.

	repository branch commit: headCommit.
	repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.
	self assertMethodExists: #m inClass: 'IceGeneratedClassForTesting'.
	
	repository workingCopy
		createMethod: 'm2 ^ 43' inClass: 'IceGeneratedClassForTesting'.

	repository commitWithMessage: 'Other commit'.

	repository workingCopy mergeCommit: mergeCommit.

	self assertMethodExists: #m2 inClass: 'IceGeneratedClassForTesting'.
	self denyMethodExists: #m inClass: 'IceGeneratedClassForTesting'.
