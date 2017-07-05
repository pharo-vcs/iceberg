instance creation
fromJSON: aDictionary
	^ self basicNew
		initializeWithJSON: aDictionary;
		yourself