printing
printOn: aStream
	aStream print: self class;
		nextPut: $(;
		nextPutAll: self package name;
		nextPutAll: ', ';
		nextPutAll: ([ self commit shortId ] 
			on: Error 
			do: [ 'loaded from: ', updationCommit shortId ]) ;
		nextPut: $).
		