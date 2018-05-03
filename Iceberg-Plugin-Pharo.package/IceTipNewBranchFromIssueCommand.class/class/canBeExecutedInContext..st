testing
canBeExecutedInContext: aToolContext

	^ aToolContext repositoryModel remotes anySatisfy: [ :each | each projectName = 'pharo' ]