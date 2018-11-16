tests-checkout
testCheckoutBranchInstallsPackageInImage

	self repository branch checkout.
	self assertPackageExists: self packageName1