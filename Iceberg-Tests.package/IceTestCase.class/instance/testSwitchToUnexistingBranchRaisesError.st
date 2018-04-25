tests-branch
testSwitchToUnexistingBranchRaisesError

	self should: [self repository switchToBranchNamed: 'nonexisting'] raise: IceBranchNotFound