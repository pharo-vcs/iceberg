storing
storeIn: aWorkingCopy
	
	| projectFile |
	projectFile := self projectFileInWorkingCopy: aWorkingCopy.
	projectFile
		ensureDelete;
		writeStreamDo: [ :stream | 
			(STONWriter on: stream) 
				prettyPrint: true;
				newLine: OSPlatform current lineEnding;
				nextPut: self properties  ].