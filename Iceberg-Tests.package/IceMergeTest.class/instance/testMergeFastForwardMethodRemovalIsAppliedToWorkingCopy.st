merge-operations
testMergeFastForwardMethodRemovalIsAppliedToWorkingCopy

	| headCommit mergeCommit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol;
		createMethod: 'm ^ 42' inClass: 'IceGeneratedClassForTesting'.

	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy removeMethod: #m fromClass:  'IceGeneratedClassForTesting'.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.
	self assertMethodExists: #m inClass: 'IceGeneratedClassForTesting'.
	
	self repository workingCopy mergeCommit: mergeCommit.

	self denyMethodExists: #m inClass: 'IceGeneratedClassForTesting'.
