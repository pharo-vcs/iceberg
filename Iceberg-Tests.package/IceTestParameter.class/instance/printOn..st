printing
printOn: aStream
	aStream
		print: self class;
		nextPut: $(;
		nextPutAll: (', ' join: (self options collect: #shortName));
		nextPut: $).