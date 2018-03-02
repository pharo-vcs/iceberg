execution
execute
	repositoryModel reloadAllLoadedPackages.
	Iceberg announcer announce: (IceRepositoryModified for: repositoryModel entity)