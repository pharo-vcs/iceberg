examples
exampleNotLoaded

	| repository |
	repository := self exampleUnbornRepository.
	repository workingCopy addPackageNamed: 'NewPackageInMemory'.
	repository commitWithMessage: 'first commit'.
	repository unload.
	self assert: repository workingCopy isLoaded not.
	^ repository