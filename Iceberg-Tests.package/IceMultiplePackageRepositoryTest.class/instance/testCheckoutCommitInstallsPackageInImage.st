tests-checkout
testCheckoutCommitInstallsPackageInImage

	repository branch commit checkout.
	self assertPackageExists: packageName1.
	self assertPackageExists: packageName2