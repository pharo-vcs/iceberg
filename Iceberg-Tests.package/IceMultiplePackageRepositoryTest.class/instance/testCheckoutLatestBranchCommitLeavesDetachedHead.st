tests-checkout
testCheckoutLatestBranchCommitLeavesDetachedHead

	repository branch commit checkoutAllPackages.
	self assert: repository head isDetached.