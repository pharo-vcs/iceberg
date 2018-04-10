private factory
newContextWithSelection: anObject 
	^ self newContext 
		packageModel: anObject;
		yourself