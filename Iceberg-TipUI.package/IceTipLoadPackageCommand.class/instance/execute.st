execution
execute
	self packageModel load.
	Iceberg announcer announce: (IceRepositoryModified for: self repositoryModel entity)