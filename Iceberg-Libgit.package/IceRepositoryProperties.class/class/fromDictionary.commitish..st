instance creation
fromDictionary: aDictionary commitish: aCommitish
	^ self new
		repository: aCommitish repository;
		commitish: aCommitish;
		properties: aDictionary;
		ensureDefaultProperties;
		yourself