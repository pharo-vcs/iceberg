tests
testCommitEmptyString	
	repository commitWithMessage: ''.
	
	self assert: repository head commit comment isEmpty.
