actions
checkoutCommitish: aCommitish

	self setHead: aCommitish.	
	workingCopy referenceCommit: aCommitish commit.
	workingCopy checkoutAllPackages.