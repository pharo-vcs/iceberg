API-registry
register
	self checkForRegistryConflicts.
	self class registerRepository: self.
	Iceberg announcer announce: (IceRepositoryCreated repository: self).
	^ self 
