tests-checkout
testCheckoutLatestBranchCommitLeavesDetachedHead

	self  repository branch commit checkoutAllPackages.
	self assert: self  repository head isDetached.