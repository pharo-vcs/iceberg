scenarios
scenarioTwoLoadedPackagesOneOutdated
	"In this scenario we have two packages loaded and one is outdated."

	"1 - Commit a new version of some package"
	| versionNumber commit |
	repository checkoutPackageNamed: packageName.
	versionNumber := self currentVersionNumber.

	self saveNewVersion.
	self assert: self currentVersionNumber equals: versionNumber + 1.

	"2 - Remove the modified package"
	self removeTestPackages.
	Smalltalk at: #Test ifPresent: [ self fail: 'Test class was not correctly removed from system.' ].

	"3 - Checkout and load the previous version"
	commit := repository branch commit parent.
	commit checkoutPackageNamed: packageName.
	commit checkoutPackageNamed: otherPackageName.

	self assert: self currentVersionNumber equals: versionNumber.
	
	"4 - Checkout (but not load) the latest version"
	repository switchToBranchNamed: 'master'.