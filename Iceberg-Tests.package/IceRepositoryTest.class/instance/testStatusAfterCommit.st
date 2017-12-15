tests - commit
testStatusAfterCommit
	self scenarioTwoDirtyPackages.
	repository commitWithMessage: 'Committing two packages together'.

	self assert: repository incomingCommits isEmpty.
	self assert: repository outgoingCommits isNotEmpty.
	self assert: (IceRepositoryModel modelFor: repository) status equals: '1 not published'.
	