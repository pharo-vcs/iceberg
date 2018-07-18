instance creation
fromDictionary: aDictionary repository: aRepository
	^ self new
		repository: aRepository;
		properties: aDictionary;
		yourself