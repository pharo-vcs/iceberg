testing
canBeExecutedInContext: aToolContext
	^ aToolContext isRepositoryMissing not 
		and: [ aToolContext repositoryModel hasRemotes ]