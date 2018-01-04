tests-checkout
testCheckoutCodeRepositoryInstallsPackageInImage

	repository checkout.
	self assertPackageExists: packageName1.
	self assertPackageExists: packageName2