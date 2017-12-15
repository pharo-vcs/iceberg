tests-checkout
testCheckoutLatestBranchCommitLeavesDetachedHead

	repository branch commit checkout.
	self assert: repository isDetached.