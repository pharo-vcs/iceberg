tests - commit
testStatusAfterCommit
	self scenarioTwoDirtyPackages.
	repository commitPackagesWithMessage: 'Committing two packages together'.
	(IceRepositoryModel modelFor: repository) status inspect.