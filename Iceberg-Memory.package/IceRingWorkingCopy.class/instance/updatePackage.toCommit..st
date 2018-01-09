accessing-monticello
updatePackage: anIceSavedPackage toCommit: anIceGitCommit 
	
	loadedPackageVersions
		at: anIceSavedPackage name
		put: anIceGitCommit