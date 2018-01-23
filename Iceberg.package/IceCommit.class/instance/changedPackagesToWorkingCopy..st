private-changes
changedPackagesToWorkingCopy: workingCopy 
	
	| loadedPackagesNames commitPackageNames |
	loadedPackagesNames := workingCopy loadedPackages collect: #name.
	commitPackageNames := self packageNames.
	^ (loadedPackagesNames
		select: [ :loadedPackageName | commitPackageNames includes: loadedPackageName ]
		thenCollect: [ :mcPackage | IceSavedPackage named: mcPackage repository: repository ]) asArray