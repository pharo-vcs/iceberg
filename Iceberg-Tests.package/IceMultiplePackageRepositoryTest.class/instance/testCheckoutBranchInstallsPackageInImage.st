tests-checkout
testCheckoutBranchInstallsPackageInImage

	repository branch checkout.
	self assertPackageExists: packageName1.
	self assertPackageExists: packageName2.