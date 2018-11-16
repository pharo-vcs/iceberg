tests
testCommitEmptyString	
	self repository commitWithMessage: ''.
	
	self assert: self repository head commit comment isEmpty.
