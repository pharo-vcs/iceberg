examples
exampleDetachedWorkingCopy

	| repository |
	repository := self exampleNotLoaded.
	repository workingCopy addPackageNamed: 'AnotherNonExistentPackage'.
	repository commitWithMessage: 'a second commit'.
	repository head commit ancestors anyOne checkout.
	self assert: repository workingCopy isDetached.
	^ repository