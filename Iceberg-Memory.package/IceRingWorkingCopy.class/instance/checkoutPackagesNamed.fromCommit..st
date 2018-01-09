private-monticello
checkoutPackagesNamed: packageNames fromCommit: aCommit
	
	packageNames do: [ :packageName | | snapshot |
		snapshot := (IceSavedPackageVersion
			fromCommit: aCommit
			package: (IceSavedPackage named: packageName repository: repository))
				mcSnapshot.
		snapshot importInto: ringEnvironment asPackageNamed: packageName.
		loadedPackageVersions at: packageName put: { aCommit }
	].