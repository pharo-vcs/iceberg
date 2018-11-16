tests-checkout
testCheckoutBranchDoesNotLeaveDetachedHead

	self repository branch checkout.
	self deny: self repository head isDetached