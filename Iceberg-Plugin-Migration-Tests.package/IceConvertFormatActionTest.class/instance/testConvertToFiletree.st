tests
testConvertToFiletree
	self repository properties fileFormat: IceLibgitTonelWriter.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'First commit'.

	self 
		assert: self repository writerClass 
		equals: IceLibgitTonelWriter.
	
	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #filetree;
		execute.
	
	self
		assert: self repository writerClass
		equals: IceLibgitFiletreeWriter.
	self assert: (self repository headCommit packageNames includes: self packageName1)