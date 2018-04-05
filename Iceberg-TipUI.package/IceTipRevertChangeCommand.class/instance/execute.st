execution
execute
	UIManager default 
		informUser: 'Reverting change...' 
		during: [ item accept: (IceRevertVisitor repository: self repositoryModel entity) ].
	self announcer announce: (IceTipDiffEntryRemoved entry: item).
	Iceberg announcer announce: (IceRepositoryModified for: self repositoryModel entity)