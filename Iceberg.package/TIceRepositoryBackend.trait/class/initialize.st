class initialization
initialize
	IceRepository defaultBackendType ifNil: [ 
		IceRepository defaultBackend: self ]