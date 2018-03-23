testing
canBeExecutedInContext: aToolContext
	^ aToolContext isRepositoryOperational
		and: [ aToolContext repositoryModel hasRemotes ]