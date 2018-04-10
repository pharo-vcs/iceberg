tests-queries
testListBranchesListsExistingBranches

	| branches |
	branches := repository allBranches.
	self assert: branches size = 1.
	self assert: branches first name equals: 'master'