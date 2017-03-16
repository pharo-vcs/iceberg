accessing
directoryPathString

	^ self subdirectory isEmptyOrNil
		ifTrue: [ self directoryName ]
		ifFalse: [ self subdirectory, '/',  self directoryName ]
	
