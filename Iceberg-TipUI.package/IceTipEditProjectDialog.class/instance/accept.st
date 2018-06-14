actions
accept	
	
	IceTipStandardAction new 
		repository: model repository;
		message: 'Setting up project';
		onSuccessRepositoryModified;
		execute: [ 
			"Update the project"
			model sourceDirectory: self selectedDirectoryPath pathString.
			"Set the project in the repository"
			model repository workingCopy project: model ].

	self window delete.
	acceptCallback ifNotNil: [ 
		acceptCallback value ].