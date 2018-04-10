scenarios
scenarioOneLoadedPackageOutdated
	"In this scenario we only one package loaded, which is outdated."

	"1 - Commit a new version of some package"
	repository loadPackageNamed: packageName.
	self saveNewVersion.

	"2 - Remove the modified package"
	self removeTestPackages.

	"3 - Checkout and load the previous version"
	repository head commit parent loadPackageNamed: packageName.
	
	"4 - Checkout (but not load) the latest version"
	repository switchToBranchNamed: 'master'.
