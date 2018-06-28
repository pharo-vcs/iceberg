instance creation
fromFileReference: aFileReference

	aFileReference exists
		ifFalse: [ ^ self empty ].
	^ self fromDictionary: (self readPropertiesFrom: aFileReference)