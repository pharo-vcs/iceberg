API-packages
notifyPackageModified: aString 
	self flag: #todo. "we cannot use #includesPackageNamed: as is because it can happen 
	that a package is present in a commit but not in image yet?"
	
	self shouldIgnoreNotifications ifTrue: [ ^ false ].
	
	(self includesInWorkingCopyPackageNamed: aString)
		ifTrue: [ | package |
			package := self packageNamed: aString.
			package isDirty ifFalse: [ 
				package beDirty.
				^ true ]].
	^ false