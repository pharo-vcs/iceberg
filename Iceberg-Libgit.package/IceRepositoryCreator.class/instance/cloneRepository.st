private actions
cloneRepository
	| repository |
	
	repository := self remoteToUse
		cloneIn: self locationToUse
		subdirectory: self subdirectory.
	self commitishName 
		ifNotNil: [ repository switchToCommitishNamed: self commitishName ].
	repository workingCopy initializePackagesFromRepository.
	repository pluginManager repositoryCreated: repository.
	^ repository