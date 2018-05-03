executing
basicExecute

	self repositoryModel createSourceDirectory.
	"Force the update of the packages"
	self repository workingCopy refreshPackages.
	Iceberg announcer announce: (IceRepositoryModified for: self repository)