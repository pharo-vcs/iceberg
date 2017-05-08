accessing settings
defaultBackendType
	^ DefaultBackendType ifNil: [ 
		[ DefaultBackendType := self detectDefaultBackend name ]
		on: IceError do: [ :e | "It may be not there yet" ] ]