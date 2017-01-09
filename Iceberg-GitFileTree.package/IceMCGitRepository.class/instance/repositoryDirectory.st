accessing
repositoryDirectory
	^ self subdirectory isEmptyOrNil
		ifTrue: [ self directory ]
		ifFalse: [ self directory parent ]