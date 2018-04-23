tests
testRecoverPropertiesFromOldCommitEvenIfHeadIsDifferent
	repository properties
		at: #bla put: #old;
		store.
	
	repository commitWithMessage: 'add properties'.
	
	"Write to disk without commit"
	repository properties
		at: #bla put: #headBla;
		store.
		
	repository commitWithMessage: 'change properties'.
	
	"Write to disk without commit"
	repository properties
		at: #bla put: #inDisk;
		store.
	
	self assert: (repository properties at: #bla) equals: #inDisk.
	self assert: (repository head properties at: #bla) equals: #headBla.
	self assert: (repository head commit parent properties at: #bla) equals: #old.