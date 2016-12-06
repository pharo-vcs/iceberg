tests
testImportOutdatedLocalRepository
	self scenarioOutdatedLocalRepository.
	self assert: (IceRepositoryModel modelFor: repository) computeStatus equals: '1 incoming'.
