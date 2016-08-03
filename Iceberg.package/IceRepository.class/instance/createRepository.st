repository handling
createRepository
	repository := (self storageClass 
		newRepositoryAt: self location
		origin: self origin
		subdirectory: (self subdirectory ifNil: '')).
		
	branch ifNotNil: [ repository branch: self branchName ].
	origin ifNil: [ origin := IceRemoteRepository url: repository remoteUrl ].
	self repository: repository.

