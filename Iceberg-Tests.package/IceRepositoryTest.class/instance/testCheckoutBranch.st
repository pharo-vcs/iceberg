tests
testCheckoutBranch
	repository command: 'branch testBranch'.
	self assert: repository branch equals: 'master'.
	
	repository checkoutBranch: 'testBranch'.

	self assert: repository branch equals: 'testBranch'