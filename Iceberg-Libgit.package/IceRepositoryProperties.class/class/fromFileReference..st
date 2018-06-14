instance creation
fromFileReference: aFileReference

	^ self fromDictionary: (self readPropertiesFrom: aFileReference)