API-properties
readProperties

	self propertiesFileReference exists
		ifFalse: [ ^ IceUnbornRepositoryProperties empty ].
	^ super readProperties.