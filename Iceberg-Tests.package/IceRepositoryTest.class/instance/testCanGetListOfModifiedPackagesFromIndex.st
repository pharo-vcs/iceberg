tests
testCanGetListOfModifiedPackagesFromIndex
	| modifiedPackageNames |
	
	(repository location / 'foo.txt')
		writeStreamDo: [ :stream |
			(ZnCharacterWriteStream on: stream binary encoding: 'utf8')
				nextPutAll: 'foo' ].
	repository addFileToIndex: 'foo.txt'.
	self assert: repository stagedPackageNames isEmpty.

	(repository location / 'Pharo-Git-Test.package/properties.json')
		writeStreamDo: [ :stream |
			(ZnCharacterWriteStream on: stream binary encoding: 'utf8')
				nextPutAll: '{}' ].
	repository addFileToIndex: 'Pharo-Git-Test.package/properties.json'.
	modifiedPackageNames := repository stagedPackageNames.
	
	self
		assert: modifiedPackageNames size
		equals: 1.
	self 
		assert: modifiedPackageNames first 
		equals: 'Pharo-Git-Test'