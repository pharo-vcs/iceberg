instance-creation
onRepository: aRepository withSourceDirectory: aDirectory
	
	^ self basicNew
		properties: Dictionary new;
		commitish: aRepository workingCopy;
		sourceDirectory: aDirectory;
		initialize;
		yourself