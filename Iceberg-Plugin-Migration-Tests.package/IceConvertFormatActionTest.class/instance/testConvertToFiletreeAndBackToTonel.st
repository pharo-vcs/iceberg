tests
testConvertToFiletreeAndBackToTonel
	"This should be two different tests,  but since testing mechanism provides a 'default' repository.
	 (which will be #tonel),  I can test first the conversion to filetree... then I can test the path
	 back (and no point on do a second test for it)"

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
	self assert: (self repository headCommit packageNames includes: self packageName1).

	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-tonel';
		mergeWithCurrentBranch: true;
		format: #tonel;
		execute.
	
	self 
		assert: self repository writerClass 
		equals: IceLibgitTonelWriter.
	self assert: (self repository headCommit packageNames includes: self packageName1).