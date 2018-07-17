instance-creation
onRepository: aRepository
	
	^ self basicNew
		properties: Dictionary new;
		commitish: aRepository workingCopy;
		initialize;
		yourself