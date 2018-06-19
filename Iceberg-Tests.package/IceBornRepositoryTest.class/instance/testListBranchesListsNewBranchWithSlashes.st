tests-branch
testListBranchesListsNewBranchWithSlashes

	| branches branchName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'feature/new'.
	self repository createBranch: branchName.
	branches := self repository allBranches.
	
	self assert: branches size equals: 2.
	branches
		detect: [ :branch | branch name = branchName ]
		ifNone: [ self fail ]