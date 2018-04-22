tests
testRecoverPropertiesFromOldCommitEvenIfDiskIsDifferent
	repository properties
		at: #bla put: #old;
		store.
	
	repository commitWithMessage: 'add properties'.
	
	"Write to disk without commit"
	repository properties
		at: #bla put: #blo;
		store.
	
	self assert: (repository properties at: #bla) equals: #blo.
	self assert: (repository head properties at: #bla) equals: #old