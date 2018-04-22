accessing
storeOn: aRepository
	(self propertiesFileReferenceInRepository: aRepository)
		ensureDelete;
		writeStreamDo: [ :stream | 
			(STONWriter on: stream) 
				prettyPrint: true;
				newLine: OSPlatform current lineEnding;
				nextPut: self properties  ]