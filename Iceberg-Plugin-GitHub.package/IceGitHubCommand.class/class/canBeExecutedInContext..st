testing
canBeExecutedInContext: aToolContext
	^ aToolContext repositoryModel entity remotes anySatisfy: [ :remote | remote url includesSubstring: 'github.com' ]