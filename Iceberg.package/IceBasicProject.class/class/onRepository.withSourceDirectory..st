instance-creation
onRepository: aRepository withSourceDirectory: aDirectory
	
	^ self basicNew
		properties: Dictionary new;
		repository: aRepository;
		commitish: aRepository workingCopy;
		sourceDirectory: aDirectory;
		initialize;
		yourself