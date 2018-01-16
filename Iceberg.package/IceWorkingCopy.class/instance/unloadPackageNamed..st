API-loading
unloadPackageNamed: aPackageName

	self unloadPackage: (IceSavedPackage named: aPackageName repository: repository)
	