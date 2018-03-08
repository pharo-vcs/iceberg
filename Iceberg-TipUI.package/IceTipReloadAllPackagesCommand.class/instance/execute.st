execution
execute
	UIManager default 
		informUser: 'Reloading packages' 
		during: [  
			Iceberg announcer suspendAllWhile: [ 
				repositoryModel entity packages
					select: #isLoaded
					thenDo: #reload ] ].
	Iceberg announcer announce: (IceRepositoryModified for: repositoryModel entity)