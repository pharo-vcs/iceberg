class initialization
handlePackagesChange: packages

	IceRepository registry do: [ :repository | | dirtyPackages |
		dirtyPackages := packages
			select: [ :package | repository workingCopy includesPackageNamed: package name ]
			thenCollect: #name.
		dirtyPackages ifNotEmpty: [ 
			dirtyPackages do: [ :each |repository notifyPackageModified: each ].
			Iceberg announcer announce: (IceRepositoryModified for: repository) ] ]