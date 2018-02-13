printing
printDescriptionOn: aStream
	aStream nextPut: $(;
		nextPutAll: package;
		nextPutAll: ', ';
		nextPutAll: (self isLoaded ifTrue: 'loaded' ifFalse: 'not loaded');
		nextPut: $)