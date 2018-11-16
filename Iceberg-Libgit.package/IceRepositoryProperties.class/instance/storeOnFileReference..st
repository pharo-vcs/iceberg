storing
storeOnFileReference: aFileReference

	aFileReference
		ensureDelete;
		writeStreamDo: [ :stream | 
			(STONWriter on: stream) 
				prettyPrint: true;
				newLine: OSPlatform current lineEnding;
				nextPut: self properties  ]