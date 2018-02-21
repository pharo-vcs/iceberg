private factory
newContextWithSelection: anObject 
	^ self newContext 
		repositoryModel: anObject;
		yourself