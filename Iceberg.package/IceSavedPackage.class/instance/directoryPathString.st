accessing
directoryPathString

	^ self subdirectory isEmptyOrNil
		ifTrue: [ self directoryName ]
		ifFalse: [ self repository subdirectory, '/',  self directoryName ].
