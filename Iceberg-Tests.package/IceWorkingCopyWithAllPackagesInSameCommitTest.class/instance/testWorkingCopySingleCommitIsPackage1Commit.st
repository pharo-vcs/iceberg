tests
testWorkingCopySingleCommitIsPackage1Commit
 	
	repository workingCopy reset.
	self
		assert: repository workingCopy workingCopyState singleCommit
		equals: (repository packageNamed: packageName1) currentCommit