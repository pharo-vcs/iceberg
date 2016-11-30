accessing
defaultBackendType
	^ DefaultBackendType ifNil: [ 
		| possibleBackends |
		possibleBackends := TIceRepositoryBackend traitUsers.
		possibleBackends size = 1 
			ifTrue: [ DefaultBackendType := possibleBackends anyOne ]
			ifFalse: [ IceError signal: (possibleBackends 
				ifEmpty: 'There are no installed backend types, please install one'
				ifNotEmpty: 'Please go to settings and select an Iceberg backend type') 
			]]