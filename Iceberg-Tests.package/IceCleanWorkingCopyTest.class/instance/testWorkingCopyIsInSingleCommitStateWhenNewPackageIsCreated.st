tests
testWorkingCopyIsInSingleCommitStateWhenNewPackageIsCreated
 	
	self repository workingCopy initializePackagesFromRepository.
	self repository workingCopy addPackageNamed: 'NewPackage'.
	
	self
		assert: self repository workingCopy workingCopyState singleCommit
		equals: (self repository packageNamed: self packageName1) currentCommit.
		
	self shouldnt: [self repository workingCopy validateCanCommit] raise: IceWorkingCopyDesyncronized 