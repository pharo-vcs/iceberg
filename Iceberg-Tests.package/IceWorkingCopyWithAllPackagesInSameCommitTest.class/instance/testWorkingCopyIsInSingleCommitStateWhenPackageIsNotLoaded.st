tests
testWorkingCopyIsInSingleCommitStateWhenPackageIsNotLoaded
 	
	(repository packageNamed: packageName1) unload.
	
	self
		assert: repository workingCopy workingCopyState singleCommit
		equals: (repository packageNamed: packageName2) currentCommit.
	
	self deny: (repository packageNamed: packageName1) isLoaded.
	self
		assert: repository workingCopy workingCopyState singleCommit
		equals: (repository packageNamed: packageName1) currentCommit.
		
	self shouldnt: [repository workingCopy validateCanCommit] raise: IceWorkingCopyDesyncronized 