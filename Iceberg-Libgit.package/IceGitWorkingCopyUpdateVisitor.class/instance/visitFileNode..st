visiting
visitFileNode: anIceFileDefinition 
	
	| reference |
	reference := repository location resolve: anIceFileDefinition path.
	reference parent ensureCreateDirectory.
	reference
		ensureDelete;
		binaryWriteStreamDo: [ :writeStream |
			writeStream nextPutAll: anIceFileDefinition contents ].