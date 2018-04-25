tests
testCommitNullString	
	self should: [self repository commitWithMessage: nil] raise: Error.
	
