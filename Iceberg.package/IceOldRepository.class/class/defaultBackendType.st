accessing settings
defaultBackendType
	^ DefaultBackendType ifNil: [ DefaultBackendType := #IceLibgitRepositoryBackend ]
