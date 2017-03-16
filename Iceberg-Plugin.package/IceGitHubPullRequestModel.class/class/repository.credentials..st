instance creation
repository: aRepository credentials: aCredentials
	^ self basicNew 
		initializeRepository: aRepository credentials: aCredentials;
		yourself