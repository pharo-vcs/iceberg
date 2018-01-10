tests
testCanSaveArbitraryFiletoGitWorkingCopy
	| content |
	content := 'a content
committed through iceberg'.

	(repository location / 'foo.bar')
		writeStreamDo: [ :stream |
			(ZnCharacterWriteStream on: stream binary encoding: 'utf8')
				nextPutAll: content ].
	self assert: (repository location / 'foo.bar') exists.
	
	self
		assert: (repository location / 'foo.bar') readStream contents
		equals: content