tests
testCanGetListOfModifiedPackagesFromIndexWhenPackageRepositoryInSubdirectory
	| modifiedPackageNames |
	
	self flag: 'TODO - clean the repository after test execution, else seconf test run will failed!'.

	origin := self 
		ensureOriginRepository: 'https://github.com/pharo-project/pharo-metacello'
		for: 'pharo-metacello'.
	repository := self createTestRepository: origin.
	repository backend subdirectory: 'repository'.
			
	repository saveContent: 'foo' inWorkingCopyFile: 'foo.package'.
	self assert: repository stagedPackageNames isEmpty.

	repository saveContent: '{}' inWorkingCopyFile: 'repository/Metacello-Base.package/properties.json'.
	modifiedPackageNames := repository stagedPackageNames.
	
	self
		assert: modifiedPackageNames size
		equals: 1.
	self 
		assert: modifiedPackageNames first 
		equals: 'Metacello-Base'