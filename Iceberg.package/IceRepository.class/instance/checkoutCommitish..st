actions
checkoutCommitish: aCommitish

	self setHead: aCommitish.
	workingCopy checkoutAllPackages.