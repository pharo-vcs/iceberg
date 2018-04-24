tests
testCommitNullString	
	self should: [repository commitWithMessage: nil] raise: Error.
	
