executing
basicExecute
	self validateCanCommit.
	UIManager default 
		informUser: 'Commiting...' 
		during: [ 
			self repository
				commitChanges: (diff copyWithOnly: items)
				withMessage: message ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository).
	