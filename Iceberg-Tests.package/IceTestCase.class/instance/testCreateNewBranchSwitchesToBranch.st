tests-branch
testCreateNewBranchSwitchesToBranch

	| createdBranch |
	createdBranch := self repository createBranch: 'new'.
	self assert: self repository head equals: createdBranch