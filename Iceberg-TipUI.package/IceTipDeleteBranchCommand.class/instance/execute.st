execution
execute

	| repository |
	repository := self repositoryModel entity.
	branch delete.
	Iceberg announcer announce: (IceRepositoryModified for: repository).