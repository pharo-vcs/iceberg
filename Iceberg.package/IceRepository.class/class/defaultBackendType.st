accessing
defaultBackendType
	^ DefaultBackendType ifNil: [ DefaultBackendType := IceLibgitLocalRepository ]