events
repositoryWasCreated: aRepository
	^ self plugins do: [ :each | each repositoryWasCreated: aRepository ]