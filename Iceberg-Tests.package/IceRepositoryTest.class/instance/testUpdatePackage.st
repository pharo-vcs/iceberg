tests - loading
testUpdatePackage
	self scenarioOneLoadedPackageOutdated.

	"1 - Verify current load status"
	self assert: repository workingCopy loadedVersions size equals: 1.

	"2 - Load newer version of package"
	(repository packageNamed: packageName) loadLatest.
	
	"3 - Package should have been updated to the latest version"
	self assert: repository workingCopy loadedVersions size equals: 1.
