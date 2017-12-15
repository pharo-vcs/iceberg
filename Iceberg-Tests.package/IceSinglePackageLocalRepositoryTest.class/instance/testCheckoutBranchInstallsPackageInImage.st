tests-checkout
testCheckoutBranchInstallsPackageInImage

	repository branch checkout.
	self assert: (RPackageOrganizer default includesPackageNamed: packageName)