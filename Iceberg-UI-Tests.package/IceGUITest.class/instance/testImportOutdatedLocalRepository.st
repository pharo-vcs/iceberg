tests
testImportOutdatedLocalRepository
	self scenarioOutdatedLocalRepository.
	self 
		assert: (IceRepositoryModel modelFor: repository) status 
		equals: '1 incoming'.
