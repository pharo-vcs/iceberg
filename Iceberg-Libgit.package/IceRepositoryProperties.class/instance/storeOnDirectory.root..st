storing
storeOnDirectory: aFileLocator root: rootDirectory

	| propertiesFileReference relativePath |
	propertiesFileReference := aFileLocator / self class propertiesFileName.
	relativePath := propertiesFileReference relativeTo: rootDirectory.
	
	propertiesFileReference resolve
		ensureDelete;
		writeStreamDo: [ :stream | 
			(STONWriter on: stream) 
				prettyPrint: true;
				newLine: OSPlatform current lineEnding;
				nextPut: self properties  ]