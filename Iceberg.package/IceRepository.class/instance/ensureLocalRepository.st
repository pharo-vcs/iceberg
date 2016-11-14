repository handling
ensureLocalRepository
	backend ifNil: [ 
		self searchExistingRepository
			ifNotNil: [ :repo | self repository: repo ]
			ifNil: [ self createRepository ]
	]