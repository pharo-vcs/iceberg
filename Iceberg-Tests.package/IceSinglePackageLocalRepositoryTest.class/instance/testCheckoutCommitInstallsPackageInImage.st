tests-checkout
testCheckoutCommitInstallsPackageInImage

	repository branch commit checkout.
	self assertPackageExists: self packageName1.