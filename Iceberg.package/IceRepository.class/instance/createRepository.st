repository handling
createRepository
	backend := (self storageClass 
		newRepositoryAt: self location
		origin: self origin
		subdirectory: (self subdirectory ifNil: '')).
	
	backend frontend: self.
	branch ifNotNil: [ backend branch: self branch name ].
	origin ifNil: [ origin := IceRemoteRepository url: backend remoteUrl ].
	self repository: backend.

