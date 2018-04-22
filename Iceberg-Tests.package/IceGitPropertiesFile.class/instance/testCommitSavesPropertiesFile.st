tests
testCommitSavesPropertiesFile
	repository properties
		at: #bla put: #blo;
		store.
	
	repository commitWithMessage: 'add properties'.
		
	self assert: (repository head properties at: #bla) equals: #blo