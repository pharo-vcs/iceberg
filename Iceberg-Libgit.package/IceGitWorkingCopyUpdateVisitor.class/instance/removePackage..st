operations
removePackage: anIcePackageDefinition 
	
	| path |
	path := anIcePackageDefinition path / (repository writerClass directoryNameFor: anIcePackageDefinition).
	(repository location resolve: path)
		ensureDeleteAll.