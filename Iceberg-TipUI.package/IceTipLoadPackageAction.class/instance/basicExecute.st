executing
basicExecute
	UIManager default
		informUser: ('Loading package {1}' format: { self package name }) 
		during: [ self package load ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository)