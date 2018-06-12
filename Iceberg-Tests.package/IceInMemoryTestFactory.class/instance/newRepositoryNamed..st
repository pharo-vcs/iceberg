initialization
newRepositoryNamed: projectName

	| repository |
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy fromWorkingCopy: repository workingCopy).
	^ repository