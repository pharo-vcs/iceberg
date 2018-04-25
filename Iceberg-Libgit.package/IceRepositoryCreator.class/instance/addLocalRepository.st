private actions
addLocalRepository
	self repository
		location: self locationToUse;
		subdirectory: self subdirectory.
	self repository pluginManager repositoryWillBeCreated: self repository.	
	self repository workingCopy initializePackagesFromRepository.
	self repository pluginManager repositoryWasCreated: self repository.
	^ self repository	