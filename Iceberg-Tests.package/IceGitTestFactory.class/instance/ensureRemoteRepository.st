initialization
ensureRemoteRepository
	| remoteRepository |
	remoteRepository := self remoteFileUrl asFileReference exists
		ifTrue: [ IceRepositoryCreator new
				location: self remoteFileUrl asFileReference;
				addLocalRepository ]
		ifFalse: [ IceRepositoryCreator new
				location: self remoteFileUrl asFileReference;
				createNewRepositoryNamed: self remoteFileUrl segments last ].
	remoteRepository workingCopy: (IceRingWorkingCopy fromWorkingCopy: remoteRepository workingCopy).
	^ remoteRepository