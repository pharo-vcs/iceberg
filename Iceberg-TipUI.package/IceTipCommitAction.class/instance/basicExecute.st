executing
basicExecute
	UIManager default 
		informUser: 'Commiting...' 
		during: [ 
			self validateCanCommit.
			self repository
				commitChanges: (diff copyWithOnly: items)
				withMessage: message.
			self isPublish ifTrue: [ self repository push ] ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository)
