printing
printOn: aStream
	aStream
		nextPutAll: 'IceNode(';
		nextPutAll: self key asString;
		nextPutAll: ')'