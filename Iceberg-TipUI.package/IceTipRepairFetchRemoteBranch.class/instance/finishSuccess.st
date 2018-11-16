executing
finishSuccess
	super finishSuccess.
	Iceberg announcer announce: (IceRepositoryModified for: self repository)