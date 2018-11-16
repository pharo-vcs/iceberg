events
repositoryWillBeCreated: aRepository
	^ self plugins do: [ :each | each repositoryWillBeCreated: aRepository ]