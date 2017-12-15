packages
addPackage: aPackage
	
	packages at: aPackage name put: aPackage.

	"Should validate that we cannot add several times the same package"
	"self loadedVersions
		at: aPackage
		put: (IceNoCommit new repository: repository; yourself)."
	"repository addPackageNamed: aPackage name"