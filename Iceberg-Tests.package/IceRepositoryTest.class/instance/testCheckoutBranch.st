tests
testCheckoutBranch
	repository command: 'branch testBranch'.
	self assert: (repository currentBranchName = 'master').
	
	repository checkoutBranch: 'testBranch'.

	self assert: (repository currentBranchName = 'testBranch')