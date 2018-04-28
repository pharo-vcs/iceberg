tests-branch
testNewBranchWithSlashReferencesCurrentCommitAtBranchTime

	| commitAtBranchTime createdBranch |
	commitAtBranchTime := self repository head commit.
	createdBranch := self repository createBranch: 'feature/new'.
	self assert: createdBranch commit equals: commitAtBranchTime