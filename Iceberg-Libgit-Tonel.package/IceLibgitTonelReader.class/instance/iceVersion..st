accessing
iceVersion: anObject
	| repository packageDirectoryName |
	iceVersion := anObject.
	repository := iceVersion commit repository.
	package := iceVersion package.
	
	packageDirectoryName := iceVersion commit writerClass directoryNameFor: package.
	self packageDirectory: (repository subdirectoryPath / packageDirectoryName) pathString