accessing
packageNames
	
	^ packageNamesCache ifNil: [ 
		packageNamesCache := self fetchPackageNames ].