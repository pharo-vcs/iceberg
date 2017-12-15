tests-checkout
testCheckoutCodeRepositoryInstallsPackageInImage

	repository checkout.
	self assert: (RPackageOrganizer default includesPackageNamed: packageName1).
	self assert: (RPackageOrganizer default includesPackageNamed: packageName2)