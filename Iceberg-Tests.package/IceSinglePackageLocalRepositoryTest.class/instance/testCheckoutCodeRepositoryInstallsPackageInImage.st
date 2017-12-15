tests-checkout
testCheckoutCodeRepositoryInstallsPackageInImage

	repository checkout.
	self assert: (RPackageOrganizer default includesPackageNamed: packageName)