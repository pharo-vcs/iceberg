private actions
addLocalRepository
	| repository |
	repository := IceLibgitRepository new
		location: self locationToUse;
		subdirectory: self subdirectory.
	repository workingCopy initializePackagesFromRepository.
	repository pluginManager repositoryCreated: repository.
	^ repository	