initialization
initialize

	super initialize.
	ringEnvironment := RG2Environment new.
	dirtyPackages := Set new.
	loadedPackageVersions := Dictionary new.