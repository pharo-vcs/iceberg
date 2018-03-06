execution
readParametersFromContext: aToolContext
	super readParametersFromContext: aToolContext.
	self repositoryModel ifNotNil: [ :model | 
		self badge: model numberOfIncomingCommits ]
	