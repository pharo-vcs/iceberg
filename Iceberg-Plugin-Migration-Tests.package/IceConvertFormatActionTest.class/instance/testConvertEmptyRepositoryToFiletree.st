tests
testConvertEmptyRepositoryToFiletree

	self commitProjectFile.

	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #filetree;
		execute.
	
	self
		assert: self repository writerClass
		equals: IceLibgitFiletreeWriter