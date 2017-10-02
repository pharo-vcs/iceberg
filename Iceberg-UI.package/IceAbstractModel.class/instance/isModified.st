testing
isModified
	self isLoaded ifFalse: [ ^ false ].
	
	^ self entity isModified