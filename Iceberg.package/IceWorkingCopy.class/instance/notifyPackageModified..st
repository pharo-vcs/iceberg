API-packages
notifyPackageModified: aString 
	| changed |
	self flag: #todo. "we cannot use #includesPackageNamed: as is because it can happen 
	that a package is present in a commit but not in image yet?"
	
	self shouldIgnoreNotifications ifTrue: [ ^ false ].
	
	changed := self includesInWorkingCopyPackageNamed: aString.
	changed ifTrue: [ self markAsDirtyPackageNamed: aString ].
	^ changed