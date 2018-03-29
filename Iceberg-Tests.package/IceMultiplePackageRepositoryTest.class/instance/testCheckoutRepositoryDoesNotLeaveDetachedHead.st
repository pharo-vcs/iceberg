tests-checkout
testCheckoutRepositoryDoesNotLeaveDetachedHead

	repository checkoutAllPackages.
	self deny: repository head isDetached