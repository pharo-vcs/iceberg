execution
execute
	self packageModel reload.
	Iceberg announcer announce: (IceRepositoryModified for: self repositoryModel entity)