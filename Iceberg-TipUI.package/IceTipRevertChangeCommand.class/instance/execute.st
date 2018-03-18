execution
execute
	UIManager default 
		informUser: 'Reverting change(s)...' 
		during: [ self halt ].
	Iceberg announcer announce: (IceRepositoryModified for: self repositoryModel entity).