API-packages
packageNamed: aString 
	
	
	(self includesPackageNamed: aString)
		ifFalse: [ self error: 'No package named ', aString ].
	^ IcePackage
		named: aString
		repository: self repository