initialize
initialize
	super initialize.
	
	repositoryProperties := self repository workingCopy referenceCommit isUnknownCommit 
		ifTrue: [IceRepositoryProperties empty] 
		ifFalse: [ IceRepositoryProperties fromFileReference: self propertiesFileReference ].
	
	repositoryProperties properties
		at: #format
		ifAbsent: [ 	repositoryProperties fileFormat: self defaultFileFormat ]