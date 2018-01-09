accessing-monticello
updatePackage: anIceSavedPackage toCommit: anIceGitCommit 
	
	anIceSavedPackage mcWorkingCopy
		versionInfo: (IceMCVersionInfo new
			fromCommit: anIceGitCommit
			package: anIceSavedPackage)