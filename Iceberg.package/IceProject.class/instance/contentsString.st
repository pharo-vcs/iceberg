storing
contentsString

	^ ByteArray streamContents: [ :stream |
		(STONWriter on: (ZnCharacterWriteStream on: stream)) 
			prettyPrint: true;
			newLine: OSPlatform current lineEnding;
			nextPut: self properties ]