tests
testConvertToTonelRemovesFiletreeMetadataFile
	self repository properties fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'First commit'.
	
	"Simulate creation of filetree metadatafile"
	(self repository subdirectoryReference / '.filetree') ensureCreateFile.
	self repository addFileToIndex: self repository subdirectoryPath / '.filetree'.
	self repository commitIndexWithMessage: 'Add .filetree file' andParents: { self repository headCommit }.

	self assert: (self repository subdirectoryReference / '.filetree') exists.

	self 
		assert: self repository writerClass 
		equals: IceLibgitFiletreeWriter.
	
	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #tonel;
		execute.
	
	self deny: (self repository subdirectoryReference / '.filetree') exists