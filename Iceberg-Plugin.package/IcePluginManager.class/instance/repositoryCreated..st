accessing ui
repositoryCreated: aRepository
	^ self plugins do: [ :each | each repositoryCreated: aRepository ]