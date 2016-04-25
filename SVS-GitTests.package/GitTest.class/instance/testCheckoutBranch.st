tests
testCheckoutBranch
	git command: 'branch testBranch'.
	self assert: (git currentBranchName = 'master').
	
	git checkoutBranch: 'testBranch'.

	self assert: (git currentBranchName = 'testBranch')