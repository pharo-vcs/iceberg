tests-branch
testCreateNewBranchSwitchesToBranch

	| createdBranch |
	createdBranch := repository createBranch: 'new'.
	self assert: repository head equals: createdBranch