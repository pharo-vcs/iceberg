initialization
tearDownWithRepository: aRepository
		
	aRepository location ifNotNil: #ensureDeleteAll.
	self remoteFileUrl asFileReference ensureDeleteAll