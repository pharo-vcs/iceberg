API-properties
readProperties
	1halt.
	self propertiesFileReference exists
		ifFalse: [ ^ IceUnbornRepositoryProperties empty ].
	^ super readProperties.