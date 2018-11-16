tests-checkout
testCheckoutLatestBranchCommitLeavesDetachedHead

	self repository branch commit checkout.
	self assert: self repository head isDetached.