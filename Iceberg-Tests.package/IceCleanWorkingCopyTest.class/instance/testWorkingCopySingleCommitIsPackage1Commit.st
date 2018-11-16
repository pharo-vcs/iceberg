tests
testWorkingCopySingleCommitIsPackage1Commit
 	
	self repository workingCopy initializePackagesFromRepository.
	self
		assert: self repository workingCopy workingCopyState singleCommit
		equals: (self repository packageNamed: self packageName1) currentCommit