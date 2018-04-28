tests-branch
testSwitchToUnexistingBranchWithSlashesRaisesError

	self should: [self repository switchToBranchNamed: 'feature/nonexisting'] raise: IceBranchNotFound