operations
removeFile: anIceFileDefinition 
	
	(workingCopy repository location resolvePath: anIceFileDefinition path) 
		ensureDelete