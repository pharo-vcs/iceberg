initialization
newRepositoryNamed: projectName withSubdirectory: aSubdirectory
	"Ignore the subdirectory in memory"
	| repository |
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy fromWorkingCopy: repository workingCopy).
	^ repository