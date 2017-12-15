*Iceberg-Adapters
directoryName
	^ (self repository writerClass 
		directoryNameFor: package)
		asString