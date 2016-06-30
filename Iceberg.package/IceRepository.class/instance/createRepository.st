repository handling
createRepository
	self repository: (self storageClass 
		newRepositoryAt: self location
		origin: self origin
		subdirectory: (self subdirectory ifNil: '')).
