execution
execute
	UIManager default 
		informUser: 'Redoing change(s)...' 
		during: [ item accept: (IceWorkingCopyPatcherVisitor on: self repositoryModel entity) ].
	Iceberg announcer announce: (IceRepositoryModified for: self repositoryModel entity).