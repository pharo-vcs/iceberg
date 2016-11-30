accessing
defaultBackend
	^ self defaultBackendType 
		ifNil: [ IceError signal: 'There are no configured backend type' ]
		ifNotNil: [ :className | Smalltalk at: className
			ifAbsent: [ IceError signal: 'Selected Iceberg backend is missing: ', className ]]