instance creation
repository: aRepository branches: aCollection groupName: aString
	^ self new
		repository: aRepository;
		branches: aCollection;
		groupName: aString;
		yourself