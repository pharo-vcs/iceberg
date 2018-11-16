operations
removeFile: anIceFileDefinition 
	
	(repository location resolvePath: anIceFileDefinition path)
		ensureDelete