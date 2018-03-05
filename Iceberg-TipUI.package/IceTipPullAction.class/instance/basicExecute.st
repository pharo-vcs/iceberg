executing
basicExecute
	UIManager default 
		informUser: ('Pulling from {1}' format: { self remote name }) 
		during: [ self repository pullFrom: self remote ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository).
