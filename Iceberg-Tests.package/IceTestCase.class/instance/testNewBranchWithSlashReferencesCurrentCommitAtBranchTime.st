tests-branch
testNewBranchWithSlashReferencesCurrentCommitAtBranchTime

	| commitAtBranchTime createdBranch |
	commitAtBranchTime := repository head commit.
	createdBranch := repository createBranch: 'feature/new'.
	self assert: createdBranch commit equals: commitAtBranchTime