private actions
addLocalRepository
	self repository location: self locationToUse.
	self repository pluginManager repositoryWillBeCreated: self repository.	
	self repository workingCopy initializePackagesFromRepository.
	self repository pluginManager repositoryWasCreated: self repository.
	^ self repository	