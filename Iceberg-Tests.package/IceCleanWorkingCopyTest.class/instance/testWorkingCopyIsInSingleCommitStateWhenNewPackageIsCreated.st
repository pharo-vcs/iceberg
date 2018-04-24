tests
testWorkingCopyIsInSingleCommitStateWhenNewPackageIsCreated
 	
	repository workingCopy initializePackagesFromRepository.
	repository workingCopy addPackageNamed: 'NewPackage'.
	
	self
		assert: repository workingCopy workingCopyState singleCommit
		equals: (repository packageNamed: self packageName1) currentCommit.
		
	self shouldnt: [repository workingCopy validateCanCommit] raise: IceWorkingCopyDesyncronized 