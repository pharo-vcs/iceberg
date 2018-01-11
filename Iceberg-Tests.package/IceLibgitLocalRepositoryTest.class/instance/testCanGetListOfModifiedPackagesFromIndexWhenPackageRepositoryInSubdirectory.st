tests
testCanGetListOfModifiedPackagesFromIndexWhenPackageRepositoryInSubdirectory
	| modifiedPackageNames |
	
	self flag: 'TODO - clean the repository after test execution, else seconf test run will failed!'.
	self timeLimit: 1 minute.


	origin := self 
		ensureOriginRepository: 'https://github.com/pharo-project/pharo-metacello'
		for: 'pharo-metacello'.
	repository2 := self createTestRepository: origin.
	repository2 subdirectory: 'repository'.
			
	(repository2 location / 'foo.package')
		writeStreamDo: [ :stream |
			(ZnCharacterWriteStream on: stream binary encoding: 'utf8')
				nextPutAll: 'foo' ].
	repository2 addFileToIndex: 'foo.package'.
	self assert: repository2 stagedPackageNames isEmpty.

	(repository2 location / 'repository/Metacello-Base.package/properties.json')
		writeStreamDo: [ :stream |
			(ZnCharacterWriteStream on: stream binary encoding: 'utf8')
				nextPutAll: '{}' ].
	repository2 addFileToIndex: 'repository/Metacello-Base.package/properties.json'.
	modifiedPackageNames := repository2 stagedPackageNames.
	
	self
		assert: modifiedPackageNames size
		equals: 1.
	self 
		assert: modifiedPackageNames first 
		equals: 'Metacello-Base'