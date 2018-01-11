tests
testImportOutdatedLocalRepository
	self scenarioOutdatedLocalRepository.
	self 
		assert: (IceRepositoryModel modelFor: repository) status asString
		equals: 'Outdated Working Copy'