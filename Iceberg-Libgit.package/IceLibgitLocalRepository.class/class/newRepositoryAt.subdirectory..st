instance creation
newRepositoryAt: aFileReference subdirectory: aString
	^ self new
		location: aFileReference;
		addSubdirectory: aString;
		yourself