private-monticello
unloadPackage: aPackage

	ringEnvironment removePackage: (ringEnvironment ask packageNamed: aPackage name).
	loadedPackageVersions removeKey: aPackage name.
	dirtyPackages remove: aPackage name ifAbsent: [ "Well..." ].