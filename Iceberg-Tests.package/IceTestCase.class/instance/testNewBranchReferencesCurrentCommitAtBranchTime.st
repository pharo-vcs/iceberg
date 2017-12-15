tests-branch
testNewBranchReferencesCurrentCommitAtBranchTime

	| commitAtBranchTime createdBranch |
	commitAtBranchTime := repository head commit.
	createdBranch := repository createBranch: 'new'.
	self assert: createdBranch commit equals: commitAtBranchTime