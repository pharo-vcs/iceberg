initialization
tearDownWithRepository: aRepository
		
	aRepository ifNotNil: [aRepository location ifNotNil: #ensureDeleteAll ].
	self remoteFileUrl asFileReference ensureDeleteAll