tests-branch
testSwitchToUnexistingBranchRaisesError

	self should: [repository switchToBranchNamed: 'nonexisting'] raise: IceBranchNotFound