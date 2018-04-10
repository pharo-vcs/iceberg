tests-branch
testListBranchesListsNewBranch

	| branches branchName |
	repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'new'.
	repository createBranch: branchName.
	branches := repository allBranches.
	
	self assert: branches size = 2.
	branches
		detect: [ :branch | branch name = branchName ]
		ifNone: [ self fail ]