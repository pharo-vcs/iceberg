events
repositoryWillBeCreated: aRepository
	
	UIManager default 
		informUser: 'Fetching incomming commits'
		during: [ aRepository fetch ].
	
	aRepository workingCopy referenceCommit: (aRepository lookupCommit: SystemVersion current commitHash)	