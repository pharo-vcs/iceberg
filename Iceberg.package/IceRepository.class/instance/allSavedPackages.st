querying
allSavedPackages
	^ self allPackages collect: [ :pkg | 
		IceSavedPackage new 
			package: pkg; 
			repository: self; 
			yourself ]
