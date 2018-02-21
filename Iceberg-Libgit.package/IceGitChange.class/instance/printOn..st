printing
printOn: aStream

	aStream
		nextPutAll: 'gitChange(';
		nextPutAll: filePathString asString;
		nextPutAll: ')'