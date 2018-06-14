tests
testRecoverPropertiesFromOldCommitEvenIfHeadIsDifferent
	self repository properties
		at: #bla put: #old.
	self repository commitWithMessage: 'add properties'.
	
	self repository properties
		at: #bla put: #headBla.
	self repository commitWithMessage: 'change properties'.
	
	self repository properties
		at: #bla put: #inMemory.
	
	self assert: (self repository properties at: #bla) equals: #inMemory.
	self assert: (self repository head properties at: #bla) equals: #headBla.
	self assert: (self repository head commit parent properties at: #bla) equals: #old.