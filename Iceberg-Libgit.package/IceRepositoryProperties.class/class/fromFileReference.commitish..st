instance creation
fromFileReference: aFileReference commitish: aCommitish

	aFileReference exists
		ifFalse: [ ^ IceUnbornRepositoryProperties fromDictionary: Dictionary new commitish: aCommitish ].
	^ self fromDictionary: (self readPropertiesFrom: aFileReference) commitish: aCommitish