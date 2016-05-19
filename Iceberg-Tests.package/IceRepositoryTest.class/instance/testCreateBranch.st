tests
testCreateBranch
	self assert: repository currentBranchName equals: 'master'.
	
	repository createBranch: 'testBranch'.

	self assert: repository currentBranchName equals: 'testBranch'