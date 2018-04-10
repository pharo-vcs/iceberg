tests-branch
testCreateExistingBranchRaisesError

	repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self should: [repository createBranch: 'master'] raise: IceBranchAlreadyExists