accessing
storageClass
	^ storageClass ifNil: [ storageClass := IceRepository defaultStorageClass ]