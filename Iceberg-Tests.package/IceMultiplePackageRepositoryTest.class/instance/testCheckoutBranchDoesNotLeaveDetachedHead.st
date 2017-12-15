tests-checkout
testCheckoutBranchDoesNotLeaveDetachedHead

	repository branch checkout.
	self deny: repository isDetached