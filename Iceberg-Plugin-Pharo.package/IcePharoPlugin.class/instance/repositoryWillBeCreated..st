events
repositoryWillBeCreated: aRepository
	SystemVersion current major < 7 ifTrue: [ ^ self ].
	
	self fetchIfNeeded: aRepository.
	(aRepository lookupCommit: SystemVersion current commitHash) adopt.