as yet unclassified
ensureRemote

	remoteFileUrl asFileReference exists ifTrue: [ ^ self ].
	IceRepositoryCreator new 
			location: remoteFileUrl asFileReference;
			createNewRepositoryNamed: remoteFileUrl segments last.