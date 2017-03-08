tests
testCanGetListOfModifiedPackagesFromIndex
	| modifiedPackageNames |
	
	repository saveContent: 'foo' inWorkingCopyFile: 'foo.txt'.
	self assert: repository stagedPackageNames isEmpty.

	repository saveContent: '{}' inWorkingCopyFile: 'Pharo-Git-Test.package/properties.json'.
	modifiedPackageNames := repository stagedPackageNames.
	
	self
		assert: modifiedPackageNames size
		equals: 1.
	self 
		assert: modifiedPackageNames first 
		equals: 'Pharo-Git-Test'