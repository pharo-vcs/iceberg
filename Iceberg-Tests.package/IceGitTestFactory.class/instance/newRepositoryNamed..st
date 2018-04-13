initialization
newRepositoryNamed: projectName

	| repository |
	(self location / projectName) ensureDeleteAll.
	repository := IceRepositoryCreator new 
			location: self location / projectName;
			createNewRepositoryNamed: projectName.
	repository workingCopy: (IceRingWorkingCopy repository: repository).
	^ repository