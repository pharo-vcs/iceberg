execution
execute

	IcePharoFogbugzModel new 
		onAccept: [ :branchName | 
			repositoryModel entity createBranch: branchName.
			Iceberg announcer announce: (IceRepositoryModified for: repositoryModel entity) ];
		openWithSpec.
