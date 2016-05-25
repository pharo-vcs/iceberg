printing
printOn: aStream
	aStream nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: packageName;
		nextPutAll: ', ';
		nextPutAll: (self isLoaded ifTrue: 'loaded' ifFalse: 'not loaded');
		nextPut: $)
		