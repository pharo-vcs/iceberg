tests-branch
testNewBranchReferencesCurrentCommitAtBranchTime

	| commitAtBranchTime createdBranch |
	commitAtBranchTime := self repository head commit.
	createdBranch := self repository createBranch: 'new'.
	self assert: createdBranch commit equals: commitAtBranchTime