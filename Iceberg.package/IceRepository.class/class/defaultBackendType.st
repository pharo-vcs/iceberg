accessing
defaultBackendType
	^ DefaultBackendType ifNil: [ DefaultBackendType := IceMCGitRepository ]