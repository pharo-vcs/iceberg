API-packages
includesPackageNamed: aString 
	
	^ ((self packagesDictionary includesKey: aString)
		and: [ (self packageNamed: aString) isLoaded ])
			or: [ self referenceCommit includesPackageNamed: aString ]