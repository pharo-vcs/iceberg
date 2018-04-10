executing
basicExecute
	IceTipRegisterRepositoryDialog new 
		beForCloneOfRepository: self repositoryModel entity;
		onAccept: [ 
			Iceberg announcer announce: (IceRepositoryModified for: self repositoryModel entity) ];
		openDialogWithSpec