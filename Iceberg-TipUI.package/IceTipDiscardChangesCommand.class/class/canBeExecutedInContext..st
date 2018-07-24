testing
canBeExecutedInContext: aToolContext
	^ aToolContext isRepositoryMissing not
		and: [ aToolContext repositoryModel entity workingCopy referenceCommit isCollection not
				and: [ aToolContext repositoryModel entity workingCopy referenceCommit isUnknownCommit not ] ]