creation
createConflictingRepositoryIn: aLocation
	
	conflictingRepository := (IceRepositoryCreator new
		location: aLocation asFileReference;
		createNewRepositoryNamed: 'conflicting')
			register;
			yourself.