initialization
tearDownWithRepository: aRepository
		
	aRepository ifNotNil: [
		aRepository free.
		Smalltalk garbageCollect.
		aRepository location ifNotNil: #ensureDeleteAll ].
	self remoteFileUrl asFileReference ensureDeleteAll