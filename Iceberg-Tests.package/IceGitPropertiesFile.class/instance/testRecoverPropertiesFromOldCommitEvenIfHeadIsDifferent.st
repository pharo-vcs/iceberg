tests
testRecoverPropertiesFromOldCommitEvenIfHeadIsDifferent
	self repository properties
		at: #bla put: #old;
		store.
	
	self repository commitWithMessage: 'add properties'.
	
	"Write to disk without commit"
	self repository properties
		at: #bla put: #headBla;
		store.
		
	self repository commitWithMessage: 'change properties'.
	
	"Write to disk without commit"
	self repository properties
		at: #bla put: #inDisk;
		store.
	
	self assert: (self repository properties at: #bla) equals: #inDisk.
	self assert: (self repository head properties at: #bla) equals: #headBla.
	self assert: (self repository head commit parent properties at: #bla) equals: #old.