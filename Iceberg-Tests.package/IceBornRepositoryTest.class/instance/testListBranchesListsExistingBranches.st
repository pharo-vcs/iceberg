tests-branch
testListBranchesListsExistingBranches

	| branches |
	branches := self repository allBranches.
	self assert: branches size equals: 1.
	self assert: branches first name equals: 'master'