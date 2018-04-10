instance creation
on: anObject 
	^ self basicNew 
		initializeEntity: anObject;
		yourself