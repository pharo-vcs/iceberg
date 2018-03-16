executing
basicExecute
	UIManager default
		informUser: ('Unloading package {1}' format: { self package name }) 
		during: [ self package unload ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository).