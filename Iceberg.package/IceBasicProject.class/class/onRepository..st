instance-creation
onRepository: aRepository
	
	^ self basicNew
		properties: Dictionary new;
		repository: aRepository;
		commitish: aRepository workingCopy;
		initialize;
		yourself