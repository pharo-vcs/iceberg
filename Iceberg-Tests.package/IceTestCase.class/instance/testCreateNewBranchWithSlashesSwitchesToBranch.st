tests-branch
testCreateNewBranchWithSlashesSwitchesToBranch

	| createdBranch |
	createdBranch := self repository createBranch: 'feature/new'.
	self assert: self repository head equals: createdBranch