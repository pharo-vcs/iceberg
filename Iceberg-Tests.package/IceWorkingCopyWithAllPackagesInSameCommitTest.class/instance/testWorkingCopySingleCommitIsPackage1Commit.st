tests
testWorkingCopySingleCommitIsPackage1Commit
 	
	repository workingCopy initializePackagesFromRepository.
	self
		assert: repository workingCopy workingCopyState singleCommit
		equals: (repository packageNamed: packageName1) currentCommit