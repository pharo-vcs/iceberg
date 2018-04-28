private actions
cloneRepository
	IceGitClone new
		location: self locationToUse;
		url: self remoteToUse url;
		execute.
	
	self repository
		location: self locationToUse;
		subdirectory: self subdirectory.
		
	self commitishName 
		ifNotNil: [ self repository switchToCommitishNamed: self commitishName ].
	self repository pluginManager repositoryWillBeCreated: self repository.	
	self repository workingCopy initializePackagesFromRepository.
	self repository pluginManager repositoryWasCreated: self repository.
	^ self repository