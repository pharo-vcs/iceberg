tests
testCreateBranch
	self assert: git currentBranchName equals: 'master'.
	
	git createBranch: 'testBranch'.

	self assert: git currentBranchName equals: 'testBranch'