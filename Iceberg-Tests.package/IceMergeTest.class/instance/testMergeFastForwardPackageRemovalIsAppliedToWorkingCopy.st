merge-operations
testMergeFastForwardPackageRemovalIsAppliedToWorkingCopy

	| headCommit mergeCommit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1.

	headCommit := self repository commitWithMessage: 'First commit'.

	(self repository workingCopy packageNamed: self packageName1)
		unload;
		remove.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertPackageExists: self packageName1.
	self assertClassExists: 'IceGeneratedClassForTesting'.

	self repository workingCopy mergeCommit: mergeCommit.
	self denyPackageExists: self packageName1.
	self denyClassExists: 'IceGeneratedClassForTesting'.