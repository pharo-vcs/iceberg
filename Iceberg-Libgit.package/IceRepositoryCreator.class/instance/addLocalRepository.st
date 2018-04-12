private actions
addLocalRepository
	| repository |
	repository := IceLibgitRepository new
		location: self locationToUse;
		subdirectory: self subdirectory.
	repository pluginManager repositoryWillBeCreated: repository.	
	repository workingCopy initializePackagesFromRepository.
	repository pluginManager repositoryWasCreated: repository.
	^ repository	