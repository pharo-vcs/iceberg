writing
forInternalStoreFileOut: aMCVersion on: aRepository
	self forInternalStore 
		fileOut: aMCVersion
		on: (IceBackendWriterAdapter for: aRepository)