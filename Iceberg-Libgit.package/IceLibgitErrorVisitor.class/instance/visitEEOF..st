visiting
visitEEOF: aLGit_GIT_EEOF

	aLGit_GIT_EEOF messageText trimmed = 'ERROR: Repository not found.'
		ifTrue: [ IceCloneRemoteNotFound signalFor: context url ].
	
	^ self visitGenericError: aLGit_GIT_EEOF