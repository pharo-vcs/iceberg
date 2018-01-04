packages
packageNamed: aString 
	
	packages
		at: aString
		ifAbsent: [ self error: 'No package named ', aString ].
	^ IceSavedPackage
		named: aString
		repository: self repository