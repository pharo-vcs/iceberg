tests-checkout
testCheckoutCommitInstallsPackageInImage

	repository branch commit checkout.
	self assert: (RPackageOrganizer default includesPackageNamed: packageName)