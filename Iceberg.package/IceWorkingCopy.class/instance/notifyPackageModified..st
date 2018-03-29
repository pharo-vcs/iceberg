API-packages
notifyPackageModified: aString 
	
	(self includesPackageNamed: aString)
		ifTrue: [ self markAsDirtyPackageNamed: aString ]