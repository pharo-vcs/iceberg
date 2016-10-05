repository handling
register
	self checkForRegistryConflicts.
	self ensureLocalRepository.
	self class registry add: self.
	Iceberg announcer announce: (IceRepositoryCreated repository: self).
	^ self 
