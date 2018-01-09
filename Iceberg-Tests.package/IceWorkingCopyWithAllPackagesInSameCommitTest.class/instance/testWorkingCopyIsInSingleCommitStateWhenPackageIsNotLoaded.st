tests
testWorkingCopyIsInSingleCommitStateWhenPackageIsNotLoaded
 	
	repository workingCopy initializePackagesFromRepository.
	(repository packageNamed: packageName1) unload.
	
	self
		assert: repository workingCopy workingCopyState singleCommit
		equals: (repository packageNamed: packageName1) currentCommit.
		
	self shouldnt: [repository workingCopy validateCanCommit] raise: IceWorkingCopyDesyncronized 