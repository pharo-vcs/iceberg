class initialization
initialize
	IceOldRepository defaultBackendType ifNil: [ 
		IceOldRepository defaultBackend: self ]