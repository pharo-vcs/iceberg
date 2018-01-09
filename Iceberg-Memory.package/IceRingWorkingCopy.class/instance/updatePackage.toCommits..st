accessing-monticello
updatePackage: aPackage toCommits: aCollection 
	
	loadedPackageVersions
		at: aPackage name
		put: aCollection
	