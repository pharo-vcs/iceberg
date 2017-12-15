as yet unclassified
directoryNameForPackage: package

	^ (self writerClass 
		directoryNameFor: package)
		asString