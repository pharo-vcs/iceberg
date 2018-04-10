printing
printOn: aStream
	aStream nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: name asString;
		nextPut: $)