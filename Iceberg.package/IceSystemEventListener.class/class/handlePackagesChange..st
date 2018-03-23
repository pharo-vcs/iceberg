class initialization
handlePackagesChange: packages

	IceRepository registry do: [ :repository | | dirtyPackages |
		dirtyPackages := packages
			select: [ :package | repository workingCopy includesPackageNamed: package name ]
			thenCollect: #name.
		dirtyPackages ifNotEmpty: [ 
			repository notifyPackageModified: dirtyPackages.
			Iceberg announcer announce: (IceRepositoryModified for: repository) ] ]