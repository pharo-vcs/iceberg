testing
canBeExecutedInContext: aToolContext

	^ aToolContext repositoryModel remotes anySatisfy: [ :each | each host = 'github.com' ]