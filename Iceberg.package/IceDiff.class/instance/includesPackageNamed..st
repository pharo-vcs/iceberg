testing
includesPackageNamed: aString
	^ self isEmpty not
		and: [ self codeSubdirectoryNode includesKey: aString ]