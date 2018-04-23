storing
removeFileDefinition: anIceFileDefinition 
	
	(repository location resolve: anIceFileDefinition path)
		ensureDelete.

	self addPath: anIceFileDefinition path