testing
canBeExecutedInContext: aToolContext
	^ aToolContext isRepositoryDetached not
		and: [ aToolContext repositoryModel hasRemotes ]