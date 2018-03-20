executing
basicExecute
	UIManager default
		informUser: ('Reloading package {1}' format: { self package name }) 
		during: [ 
			Iceberg announcer suspendAllWhile: [ 
				self package reload ] ].	
	Iceberg announcer announce: (IceRepositoryModified for: self repository)