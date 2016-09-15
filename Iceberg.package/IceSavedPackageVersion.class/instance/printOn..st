printing
printOn: aStream
	aStream print: self class;
		nextPut: $(;
		nextPutAll: self package name;
		nextPutAll: ', ';
		nextPutAll: self internalCommitId ;
		nextPut: $).
		