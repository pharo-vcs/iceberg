tests
testWorkingCopySingleCommitIsPackage2Commit
 	
	repository workingCopy initializePackagesFromRepository.
	self
		assert: repository workingCopy workingCopyState singleCommit
		equals: (repository packageNamed: packageName2) currentCommit