instance creation
forRepository: aRepository 
	^ self 
		forRepository: aRepository
		commit: aRepository head