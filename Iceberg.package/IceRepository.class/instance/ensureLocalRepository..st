repository handling
ensureLocalRepository: branchName
	backend ifNil: [ 
		self searchExistingRepository
			ifNotNil: [ :repo | 
				self backend: repo.
				self checkoutBranch: branchName ]
			ifNil: [ self createRepository: branchName ]
	]