tests-branch
testCreateNewBranchWithSlashesSwitchesToBranch

	| createdBranch |
	createdBranch := repository createBranch: 'feature/new'.
	self assert: repository head equals: createdBranch