printing
printOn: aStream

	aStream
		nextPutAll: self class name;
		nextPutAll: ': ';
		print: self name