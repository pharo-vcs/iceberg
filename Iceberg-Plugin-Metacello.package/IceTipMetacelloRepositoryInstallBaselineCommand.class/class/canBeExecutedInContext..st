testing
canBeExecutedInContext: aToolContext
	self flag: #todo. "Demeters law"
	^ aToolContext repositoryModel entity workingCopy packages
		anySatisfy: [ :each | each name beginsWith: self baselinePrefix ]