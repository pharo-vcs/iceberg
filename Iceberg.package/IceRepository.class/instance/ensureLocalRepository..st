repository handling
ensureLocalRepository: branchName
	backend ifNil: [ self createRepository: branchName ]
