tests
testConvertEmptyRepositoryToTonel

	self commitProjectFile.

	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #tonel;
		execute.
	
	self
		assert: self repository writerClass
		equals: IceLibgitTonelWriter