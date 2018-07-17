instance creation
fromFileReference: aFileReference repository: aRepository

	aFileReference exists
		ifFalse: [ ^ IceUnbornRepositoryProperties fromDictionary: Dictionary new repository: aRepository ].
	^ self fromDictionary: (self readPropertiesFrom: aFileReference) repository: aRepository