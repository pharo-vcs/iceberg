repository handling
createRepository: branchName
	| _backend |
	_backend := (self storageClass 
		newRepositoryAt: self location
		origin: self origin
		subdirectory: (self subdirectory ifNil: '')).
	
	branchName ifNotNil: [ _backend branch: branchName ].

	_backend frontend: self.
	origin ifNil: [ origin := IceRemoteRepository url: _backend remoteUrl ].

	(self location exists not or: [ self location hasChildren not ])
		ifTrue: [ _backend cloneRepository ].

	self backend: _backend
