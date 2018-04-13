tests
testWorkingCopySingleCommitIsPackage1Commit
 	
	repository workingCopy initializePackagesFromRepository.
	self
		assert: repository workingCopy workingCopyState singleCommit
		equals: (repository packageNamed: self packageName1) currentCommit