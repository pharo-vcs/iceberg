examples
exampleDetachedHead

	| repository |
	repository := self exampleWithNoChanges.
	repository head commit checkout.
	self assert: repository head isDetached.
	^ repository