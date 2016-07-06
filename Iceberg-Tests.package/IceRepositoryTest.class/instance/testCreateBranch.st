tests
testCreateBranch
	self assert: repository branch equals: 'master'.
	self assert: (self gitCommand: 'symbolic-ref --short HEAD') trim equals: 'master'.
	
	repository createBranch: 'testBranch'.

	self assert: repository branch equals: 'testBranch'.
	self assert: (self gitCommand: 'symbolic-ref --short HEAD') trim equals: 'testBranch'.
	