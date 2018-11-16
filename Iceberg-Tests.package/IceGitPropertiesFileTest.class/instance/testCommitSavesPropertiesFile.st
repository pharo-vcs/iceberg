tests
testCommitSavesPropertiesFile
	self repository properties
		at: #bla put: #blo.
	self repository commitWithMessage: 'add properties'.
		
	self assert: (self repository head properties at: #bla) equals: #blo