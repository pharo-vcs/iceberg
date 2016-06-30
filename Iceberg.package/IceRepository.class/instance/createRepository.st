repository handling
createRepository
	self repository: (self storageClass 
		newRepositoryAt: self location
		remoteUrl: self origin url
		subdirectory: (self subdirectory ifNil: '')).
