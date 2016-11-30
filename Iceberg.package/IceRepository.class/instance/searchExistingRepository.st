repository handling
searchExistingRepository
	^ self class defaultBackend allInstances 
		detect: [ :repo | repo remoteUrl = self origin ]
		ifFound: [ :repo | repo validate ]
		ifNone: [ nil ]