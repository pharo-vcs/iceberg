tests-checkout
testCheckoutCodeRepositoryInstallsPackageInImage

	repository checkoutAllPackages.
	self assertPackageExists: self packageName1.
	self assertPackageExists: self packageName2