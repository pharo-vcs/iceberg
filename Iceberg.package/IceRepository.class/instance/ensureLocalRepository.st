repository handling
ensureLocalRepository
	repository ifNil: [ 
		repository := self searchExistingRepository.
		repository ifNil: [ self createRepository ]
	]