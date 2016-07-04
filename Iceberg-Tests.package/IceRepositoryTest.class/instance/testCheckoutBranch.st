tests
testCheckoutBranch
	"Prepare"
	self gitCommand: 'branch testBranch'.
	self assert: repository branch equals: 'master'.
	
	"Exercise"
	repository checkoutBranch: 'testBranch'.

	"Assert"
	self assert: repository branch equals: 'testBranch'