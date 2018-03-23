private-monticello
checkoutPackagesNamed: packageNames fromCommit: aCommit
	
	packageNames do: [ :packageName | | package snapshot |
		package := self packageNamed: packageName.
		snapshot := (IceSavedPackageVersion
			fromCommit: aCommit
			package: package)
				mcSnapshot.
		snapshot importInto: ringEnvironment asPackageNamed: packageName.
		loadedPackageVersions at: packageName put: { aCommit }.
		package beClean.
	].