accessing
defaultBackend
	^ self defaultBackendType
		ifNil: [ TIceRepositoryBackend traitUsers
				ifEmpty: [ IceError signal: 'There are no configured backend type' ]
				ifNotEmpty: [ :users | 
					| backend |
					backend := users anyOne.
					self defaultBackend: backend.
					backend ] ]
		ifNotNil: [ :className | 
			Smalltalk
				at: className
				ifAbsent:
					[ IceError signal: 'Selected Iceberg backend is missing: ' , className ] ]