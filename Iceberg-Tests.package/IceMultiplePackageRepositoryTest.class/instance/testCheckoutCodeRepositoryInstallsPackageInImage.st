tests-checkout
testCheckoutCodeRepositoryInstallsPackageInImage

	repository checkoutAllPackages.
	self assertPackageExists: packageName1.
	self assertPackageExists: packageName2