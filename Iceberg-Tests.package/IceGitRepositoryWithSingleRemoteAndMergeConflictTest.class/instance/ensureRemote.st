test-support
ensureRemote
	
	remoteFileUrl asFileReference exists ifTrue: [ ^ self ].
	remoteRepository := IceRepositoryCreator new 
			location: remoteFileUrl asFileReference;
			createNewRepositoryNamed: remoteFileUrl segments last.
	remoteRepository workingCopy: (IceRingWorkingCopy repository: remoteRepository).