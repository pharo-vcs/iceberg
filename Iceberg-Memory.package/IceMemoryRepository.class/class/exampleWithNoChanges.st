examples
exampleWithNoChanges

	| repository |
	repository := self exampleNotLoaded.
	repository checkout.
	self assert: repository isModified not.
	^ repository