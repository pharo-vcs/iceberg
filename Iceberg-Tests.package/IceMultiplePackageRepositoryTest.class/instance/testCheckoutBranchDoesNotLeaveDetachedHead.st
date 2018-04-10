tests-checkout
testCheckoutBranchDoesNotLeaveDetachedHead

	repository branch checkout.
	self deny: repository head isDetached