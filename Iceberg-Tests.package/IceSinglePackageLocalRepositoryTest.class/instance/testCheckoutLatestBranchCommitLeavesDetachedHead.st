tests-checkout
testCheckoutLatestBranchCommitLeavesDetachedHead

	repository branch commit checkout.
	self assert: repository head isDetached.