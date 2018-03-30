private-packages
includesInWorkingCopyPackageNamed: aString 
	^ (self packagesDictionary includesKey: aString)
		and: [ (self packageNamed: aString) isLoaded ]