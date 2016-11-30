repository handling
searchExistingRepository
	^ self class defaultBackendType allInstances 
		detect: [ :repo | repo remoteUrl = self origin ]
		ifFound: [ :repo | repo validate ]
		ifNone: [ nil ]