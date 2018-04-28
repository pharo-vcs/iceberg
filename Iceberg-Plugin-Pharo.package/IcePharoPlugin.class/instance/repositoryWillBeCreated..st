events
repositoryWillBeCreated: aRepository
	SystemVersion current major < 7 ifTrue: [ ^ self ].
	
	self fetchIfNeeded: aRepository.
	aRepository workingCopy referenceCommit: (aRepository lookupCommit: SystemVersion current commitHash)