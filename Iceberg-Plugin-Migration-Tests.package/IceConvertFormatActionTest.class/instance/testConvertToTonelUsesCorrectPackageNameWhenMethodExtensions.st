tests
testConvertToTonelUsesCorrectPackageNameWhenMethodExtensions

	self repository properties fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'test ^ 42'
		tagged: 'Tagged'
		extendingClass: #Object 
		inPackage: self packageName1.
	self repository commitWithMessage: 'First commit'.
	self repository workingCopy
		unloadPackageNamed: self packageName1.

	self 
		assert: self repository writerClass 
		equals: IceLibgitFiletreeWriter.
	
	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #tonel;
		execute.
	
	self
		assert: self repository writerClass
		equals: IceLibgitTonelWriter.
		
	self assert: (self repository headCommit packageNames includes: self packageName1).
	self deny: (self repository headCommit packageNames includes: (self packageName1, '-Tagged'))	