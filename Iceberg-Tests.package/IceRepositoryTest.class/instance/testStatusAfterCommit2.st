tests - commit
testStatusAfterCommit2
	self scenarioTwoDirtyPackages.

	repository 
		commitPackages: repository workingCopyDiff changedPackages
		withMessage: 'Committing two packages together'.

	self assert: repository incomingCommits isEmpty.
	self assert: repository outgoingCommits isNotEmpty.
	self assert: (IceRepositoryModel modelFor: repository) status equals: '1 not published'.
	