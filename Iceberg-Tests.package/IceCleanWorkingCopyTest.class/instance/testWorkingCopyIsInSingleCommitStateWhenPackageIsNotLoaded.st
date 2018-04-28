tests
testWorkingCopyIsInSingleCommitStateWhenPackageIsNotLoaded
 	
	(self repository packageNamed: self packageName1) unload.
	
	self
		assert: self repository workingCopy workingCopyState singleCommit
		equals: (self repository packageNamed: self packageName2) currentCommit.
	
	self deny: (self repository packageNamed: self packageName1) isLoaded.
	self
		assert: self repository workingCopy workingCopyState singleCommit
		equals: (self repository packageNamed: self packageName1) currentCommit.
		
	self shouldnt: [self repository workingCopy validateCanCommit] raise: IceWorkingCopyDesyncronized 