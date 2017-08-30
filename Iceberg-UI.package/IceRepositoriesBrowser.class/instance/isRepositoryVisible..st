private testing
isRepositoryVisible: aRepository
	^ aRepository isSystemRepository not 
		or: [ Iceberg showSystemRepositories ]