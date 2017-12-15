private-operations
checkoutCommitish: aCommitish
	
	self loadCodeInCommit: aCommitish commit.
	head := aCommitish