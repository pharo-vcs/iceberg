tests
testImportOutdatedLocalRepository
	self scenarioOutdatedLocalRepository.
	self 
		assert: (IceRepositoryModel modelFor: repository) status asString
		equals: 'Uncommited changes, 1 incoming'