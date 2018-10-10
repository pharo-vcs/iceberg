initialization
tearDownWithRepository: aRepository
		
	aRepository ifNotNil: [
		aRepository free.
		aRepository location ifNotNil: #ensureDeleteAll ].
	self remoteFileUrl asFileReference ensureDeleteAll