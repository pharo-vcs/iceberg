accessing settings
defaultBackendType
	^ DefaultBackendType ifNil: [ DefaultBackendType := self detectDefaultBackend name ]