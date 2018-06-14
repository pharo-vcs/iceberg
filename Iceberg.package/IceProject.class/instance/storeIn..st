storing
storeIn: anIceWorkingCopy

	(anIceWorkingCopy fileSystem resolve: self propertiesFilePath) parent ensureCreateDirectory.
	repositoryProperties
		storeOnFileReference: (anIceWorkingCopy fileSystem resolve: self propertiesFilePath).
	(anIceWorkingCopy fileSystem resolve: self projectFilePath)
		ensureDelete;
		writeStreamDo: [ :stream | 
			(STONWriter on: stream) 
				prettyPrint: true;
				newLine: OSPlatform current lineEnding;
				nextPut: self properties  ].