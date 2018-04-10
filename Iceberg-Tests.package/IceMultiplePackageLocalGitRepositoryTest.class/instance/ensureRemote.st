running
ensureRemote
	
	remoteFileUrl asFileReference exists ifTrue: [ ^ self ].
	IceRepositoryCreator new 
			location: remoteFileUrl asFileReference;
			createNewRepositoryNamed: remoteFileUrl segments last.