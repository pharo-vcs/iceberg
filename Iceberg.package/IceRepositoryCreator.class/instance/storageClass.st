accessing
storageClass
	^ storageClass ifNil: [ storageClass := IceRepository defaultBackendType ]