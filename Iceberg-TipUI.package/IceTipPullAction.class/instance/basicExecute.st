executing
basicExecute
	UIManager default 
		informUser: ('Pushing to {1}' format: { self remote name }) 
		during: [ self repository pullFrom: self remote ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository)