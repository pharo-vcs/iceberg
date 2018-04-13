initialization
newRepositoryNamed: projectName

	| repository |
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy repository: repository).
	^ repository