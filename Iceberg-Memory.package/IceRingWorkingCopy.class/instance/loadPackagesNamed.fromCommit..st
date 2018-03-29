private-monticello
loadPackagesNamed: packageNames fromCommit: aCommit
	
	packageNames do: [ :packageName | | package snapshot |
		package := self packageNamed: packageName.
		snapshot := (IceSavedPackageVersion
			fromCommit: aCommit
			package: package)
				mcSnapshot.
		snapshot importInto: ringEnvironment asPackageNamed: packageName.
		package beClean.
	].
	self referenceCommit: aCommit