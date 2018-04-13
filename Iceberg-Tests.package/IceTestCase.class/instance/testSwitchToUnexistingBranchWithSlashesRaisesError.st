tests-branch
testSwitchToUnexistingBranchWithSlashesRaisesError

	self should: [repository switchToBranchNamed: 'feature/nonexisting'] raise: IceBranchNotFound