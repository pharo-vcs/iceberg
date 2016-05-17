repository handling
searchExistingRepository
	^ MCFileTreeGitRemoteRepository superclass allInstances 
		detect: [ :repo | repo remoteUrl = self origin ]
		ifNone: [ nil ]