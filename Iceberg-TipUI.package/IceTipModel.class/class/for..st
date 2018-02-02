instance creation
for: anObject 
	^ self basicNew 
		initializeEntity: anObject;
		yourself