instance creation
repository: aRepository method: aMethod
	^ self basicNew 
		initializeRepository: aRepository method: aMethod;
		yourself