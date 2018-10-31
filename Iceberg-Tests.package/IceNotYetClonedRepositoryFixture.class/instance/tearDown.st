running
tearDown

	Smalltalk garbageCollect.
	self location ifNotNil: #ensureDeleteAll.