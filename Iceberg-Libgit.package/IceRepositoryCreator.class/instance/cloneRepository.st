private actions
cloneRepository
	| repository |
	
	repository := self remoteToUse
		cloneIn: self locationToUse
		subdirectory: self subdirectory.
	self branchName 
		ifNotNil: [ repository switchToBranchNamed: self branchName ].
	repository workingCopy initializePackagesFromRepository.
	repository pluginManager repositoryCreated: repository.
	^ repository