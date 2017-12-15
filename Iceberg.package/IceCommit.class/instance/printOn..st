printing
printOn: aStream

	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: self id asString;
		nextPutAll: ')'