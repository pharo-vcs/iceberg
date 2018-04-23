accessing
iceVersion: anObject
	| repository packageDirectoryName directoryName |
	iceVersion := anObject.
	repository := iceVersion commit repository.
	package := iceVersion package.
	
	packageDirectoryName := iceVersion commit writerClass directoryNameFor: package.
	directoryName := repository subdirectory isEmptyOrNil
		ifTrue: [ packageDirectoryName ]
		ifFalse: [ repository subdirectory, '/',  packageDirectoryName ].
	
	self packageDirectory: directoryName