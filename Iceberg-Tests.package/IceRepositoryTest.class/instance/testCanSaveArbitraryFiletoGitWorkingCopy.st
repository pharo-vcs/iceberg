tests
testCanSaveArbitraryFiletoGitWorkingCopy
	| content |
	content := 'a content
committed through iceberg'.

	repository 
		saveContent: content
		inWorkingCopyFile: 'foo.bar'.
		
	self assert: (repository location / 'foo.bar') exists.
	
	self
		assert: (repository location / 'foo.bar') readStream contents
		equals: content