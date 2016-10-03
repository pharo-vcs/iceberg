repository handling
createRepository
	repository := (self storageClass 
		newRepositoryAt: self location
		origin: self origin
		subdirectory: (self subdirectory ifNil: '')).
	
	repository frontend: self.
	branch ifNotNil: [ repository branch: self branch name ].
	origin ifNil: [ origin := IceRemoteRepository url: repository remoteUrl ].
	self repository: repository.

