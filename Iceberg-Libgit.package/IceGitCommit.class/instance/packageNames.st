accessing
packageNames
	
	^ packageNamesCache ifNil: [ 
		packageNamesCache := super packageNames ].