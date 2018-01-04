tests
testCanGetListOfModifiedPackagesFromIndexWhenPackageRepositoryInSubdirectory
	| modifiedPackageNames |
	
	self flag: 'TODO - clean the repository after test execution, else seconf test run will failed!'.

	origin := self 
		ensureOriginRepository: 'https://github.com/pharo-project/pharo-metacello'
		for: 'pharo-metacello'.
	repository := self createTestRepository: origin.
	repository subdirectory: 'repository'.
			
	(repository location / 'foo.package')
		writeStreamDo: [ :stream |
			(ZnCharacterWriteStream on: stream binary encoding: 'utf8')
				nextPutAll: 'foo' ].
	repository addFileToIndex: (repository location / 'foo.package').
	self assert: repository stagedPackageNames isEmpty.

	(repository location / 'repository/Metacello-Base.package/properties.json')
		writeStreamDo: [ :stream |
			(ZnCharacterWriteStream on: stream binary encoding: 'utf8')
				nextPutAll: '{}' ].
	repository addFileToIndex: (repository location / 'repository/Metacello-Base.package/properties.json').
	modifiedPackageNames := repository stagedPackageNames.
	
	self
		assert: modifiedPackageNames size
		equals: 1.
	self 
		assert: modifiedPackageNames first 
		equals: 'Metacello-Base'