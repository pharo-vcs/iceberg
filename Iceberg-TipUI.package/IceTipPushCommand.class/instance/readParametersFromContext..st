execution
readParametersFromContext: aToolContext
	super readParametersFromContext: aToolContext.
	(self repositoryModel isNotNil and: [self repositoryModel isMissing not]) ifTrue: [  
		self badge: self repositoryModel numberOfOutgoingCommits ]