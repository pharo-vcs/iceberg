instance creation
fromFileReference: aFileReference

	aFileReference exists
		ifFalse: [ ^ IceUnbornRepositoryProperties empty ].

	^ self fromDictionary: (self readPropertiesFrom: aFileReference)