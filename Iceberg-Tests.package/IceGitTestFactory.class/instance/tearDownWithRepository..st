initialization
tearDownWithRepository: aRepository
		
	aRepository location ensureDeleteAll.
	self remoteFileUrl asFileReference ensureDeleteAll