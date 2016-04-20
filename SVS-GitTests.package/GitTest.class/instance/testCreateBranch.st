tests
testCreateBranch
	self assert: (git currentBranchName = 'master').
	
	git createBranch: 'testBranch'.

	self assert: (git currentBranchName = 'testBranch')