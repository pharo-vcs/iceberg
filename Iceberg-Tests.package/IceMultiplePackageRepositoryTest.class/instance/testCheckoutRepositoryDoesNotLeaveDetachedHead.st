tests-checkout
testCheckoutRepositoryDoesNotLeaveDetachedHead

	repository checkout.
	self deny: repository isDetached