initialize
initialize
	super initialize.
	
	repositoryProperties := IceRepositoryProperties fromFileReference: self propertiesFileReference.
	
	repositoryProperties properties
		at: #format
		ifAbsent: [ 	repositoryProperties fileFormat: self defaultFileFormat ]