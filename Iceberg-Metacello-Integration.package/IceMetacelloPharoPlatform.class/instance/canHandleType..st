testing
canHandleType: type
	^ Iceberg enableMetacelloIntegration 
		and: [ IceMetacelloRepositoryType canHandleType: type ]