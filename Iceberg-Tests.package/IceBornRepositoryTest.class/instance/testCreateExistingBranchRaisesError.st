tests-branch
testCreateExistingBranchRaisesError

	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self should: [self repository createBranch: 'master'] raise: IceBranchAlreadyExists