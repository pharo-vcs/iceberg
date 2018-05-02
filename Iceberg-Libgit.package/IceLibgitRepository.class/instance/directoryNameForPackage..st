API-packages
directoryNameForPackage: package

	^ (self writerClass 
		directoryNameFor: package)
		asString