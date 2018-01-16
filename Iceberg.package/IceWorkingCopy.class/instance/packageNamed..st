API-packages
packageNamed: aString 
	
	
	(self includesPackageNamed: aString)
		ifFalse: [ self error: 'No package named ', aString ].
	^ IceSavedPackage
		named: aString
		repository: self repository