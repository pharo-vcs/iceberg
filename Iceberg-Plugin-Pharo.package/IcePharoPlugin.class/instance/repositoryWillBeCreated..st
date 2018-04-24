events
repositoryWillBeCreated: aRepository

	self fetchIfNeeded: aRepository.
	aRepository workingCopy referenceCommit: (aRepository lookupCommit: SystemVersion current commitHash)