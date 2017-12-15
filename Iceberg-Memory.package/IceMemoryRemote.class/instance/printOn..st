printing
printOn: aStream

	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		print: remoteRepository;
		nextPutAll: ')'