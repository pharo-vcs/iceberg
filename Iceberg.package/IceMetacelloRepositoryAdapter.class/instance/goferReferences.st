accessing
goferReferences
	^ self repository packages collect: [ :package | 
		GoferResolvedReference name: package latestVersion info name repository: self ]