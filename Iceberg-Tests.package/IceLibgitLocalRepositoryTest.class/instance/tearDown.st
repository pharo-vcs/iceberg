running
tearDown

	repository2 ifNotNil: [ :each |
		each forget.
		each location ensureDeleteAll ].
	
	super tearDown.