scenarios
scenarioTwoLoadedPackagesOneOutdated
	"In this scenario we have two packages loaded and one is outdated."

	"1 - Commit a new version of some package"
	repository loadPackage: packageName.
	self saveNewVersion.

	"2 - Remove the modified package"
	self removeTestPackages.

	"3 - Checkout and load the previous version"
	repository checkoutBranch: 'master^1'.
	repository loadPackage: packageName.
	repository loadPackage: otherPackageName.
	
	"4 - Checkout (but not load) the latest version"
	repository checkoutBranch: 'master'.
