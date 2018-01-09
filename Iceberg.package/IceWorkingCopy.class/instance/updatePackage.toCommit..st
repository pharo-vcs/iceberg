accessing-monticello
updatePackage: anIceSavedPackage toCommit: anIceGitCommit 
	
	anIceSavedPackage isLoaded 
		ifFalse: [ ^ self ].
	
	anIceSavedPackage mcWorkingCopy
		versionInfo: (IceMCVersionInfo new
			fromCommit: anIceGitCommit
			package: anIceSavedPackage)