tests-branch
testCreateExistingBranchRaisesError

	self should: [repository createBranch: 'master'] raise: IceBranchAlreadyExists