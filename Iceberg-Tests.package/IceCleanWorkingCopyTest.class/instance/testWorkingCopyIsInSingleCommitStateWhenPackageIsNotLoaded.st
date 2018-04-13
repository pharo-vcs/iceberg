tests
testWorkingCopyIsInSingleCommitStateWhenPackageIsNotLoaded
 	
	(repository packageNamed: self packageName1) unload.
	
	self
		assert: repository workingCopy workingCopyState singleCommit
		equals: (repository packageNamed: self packageName2) currentCommit.
	
	self deny: (repository packageNamed: self packageName1) isLoaded.
	self
		assert: repository workingCopy workingCopyState singleCommit
		equals: (repository packageNamed: self packageName1) currentCommit.
		
	self shouldnt: [repository workingCopy validateCanCommit] raise: IceWorkingCopyDesyncronized 