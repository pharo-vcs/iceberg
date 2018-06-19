instance-creation
named: aString path: aPath contents: contents
	
	^ (self named: aString)
		path: aPath;
		basicContents: contents
		yourself