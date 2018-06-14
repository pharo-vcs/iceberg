tests
testRecoverPropertiesFromOldCommitEvenIfDiskIsDifferent
	self repository properties
		at: #bla put: #old.
	
	self repository commitWithMessage: 'add properties'.
	
	"Write to disk without commit"
	self repository properties
		at: #bla put: #blo.
	
	self assert: (self repository properties at: #bla) equals: #blo.
	self assert: (self repository head properties at: #bla) equals: #old