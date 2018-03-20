executing
basicExecute
	UIManager default 
		informUser: 'Reloading packages' 
		during: [  
			Iceberg announcer suspendAllWhile: [ 
				self repository packages
					select: #isLoaded
					thenDo: #reload ] ].
	Iceberg announcer announce: (IceRepositoryModified for: self repository)