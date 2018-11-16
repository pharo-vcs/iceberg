instance creation
repositoryModel: aRepositoryModel on: anObject 
	^ self basicNew		
		initializeEntity: anObject;
		repositoryModel: aRepositoryModel;
		yourself