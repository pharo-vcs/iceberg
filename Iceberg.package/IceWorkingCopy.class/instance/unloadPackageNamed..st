API-loading
unloadPackageNamed: aPackageName

	self unloadPackage: (IcePackage named: aPackageName repository: repository)
	