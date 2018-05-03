visiting
visitEEOF: aLGit_GIT_EEOF

	aLGit_GIT_EEOF messageText trimmed = 'ERROR: Repository not found.'
		ifTrue: [ IceCloneRemoteNotFound signalFor: self ].
	
	^ self visitGenericError: aLGit_GIT_EEOF