executing
basicExecute

	self repositoryModel createSourceDirectory.
	"Force the update of the packages"
	self repository workingCopy refreshProject.
	Iceberg announcer announce: (IceRepositoryModified for: self repository)