registry
register
	self ensureLocalRepository.
	self class registry add: self.
	Iceberg announcer announce: IceRepositoryCreated new.
	^ self 
