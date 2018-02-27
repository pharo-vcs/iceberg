private factory
newContext
	^ super newContext 
		repositoryModel: self model;
		yourself