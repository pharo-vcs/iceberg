merge-operations
testMergeNonFastForwardLocalMethodRemovalIsNotInMergeTree

	| headCommit mergeCommit mergeTree |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol;
		createMethod: 'm ^ 42' inClass: 'IceGeneratedClassForTesting';
		createMethod: 'm2 ^ 43' inClass: 'IceGeneratedClassForTesting'.

	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy removeMethod: #m fromClass:  'IceGeneratedClassForTesting'.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.
	self assertMethodExists: #m inClass: 'IceGeneratedClassForTesting'.
	
	self repository workingCopy removeMethod: #m2 fromClass:  'IceGeneratedClassForTesting'.

	self repository commitWithMessage: 'Other commit'.

	
	mergeTree := IceMerge new
		repository: self repository;
		mergeCommit: mergeCommit;
		mergeTree.

	self deny: ((mergeTree / self packageName1 / 'IceGeneratedClassForTesting')
		includesKey: #m2).

