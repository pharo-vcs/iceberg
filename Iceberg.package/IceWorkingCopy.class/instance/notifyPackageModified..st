API-packages
notifyPackageModified: aString 
	self flag: #todo. "we cannot use #includesPackageNamed: as is because it can happen 
	that a package is present in a commit but not in image yet?"
	(self includesInWorkingCopyPackageNamed: aString)
		ifTrue: [ self markAsDirtyPackageNamed: aString ]