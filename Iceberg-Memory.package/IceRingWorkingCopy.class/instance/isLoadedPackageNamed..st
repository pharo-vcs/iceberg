packages
isLoadedPackageNamed: aString 
	
	^ (ringEnvironment ask packageNamed: aString) notNil