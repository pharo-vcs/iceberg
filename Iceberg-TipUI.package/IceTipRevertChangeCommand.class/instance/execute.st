execution
execute
	UIManager default 
		informUser: 'Reverting change...' 
		during: [ self repositoryModel entity workingCopy discardChanges: item ].
	self announcer announce: (IceTipDiffEntryRemoved entry: item).
	Iceberg announcer announce: (IceRepositoryModified for: self repositoryModel entity)