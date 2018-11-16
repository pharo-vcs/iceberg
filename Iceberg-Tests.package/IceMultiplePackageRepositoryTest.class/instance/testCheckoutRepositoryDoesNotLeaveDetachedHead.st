tests-checkout
testCheckoutRepositoryDoesNotLeaveDetachedHead

	self  repository checkoutAllPackages.
	self deny: self  repository head isDetached