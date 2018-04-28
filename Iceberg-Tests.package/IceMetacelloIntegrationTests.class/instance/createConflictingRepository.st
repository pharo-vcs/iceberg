creation
createConflictingRepository
	
	conflictingRepository := (IceRepositoryCreator new
		location: 'temp/test' asFileReference;
		createNewRepositoryNamed: 'conflicting')
			register;
			yourself.