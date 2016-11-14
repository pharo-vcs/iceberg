repository handling
createRepository: branchName
	| _backend |
	_backend := (self storageClass 
		newRepositoryAt: self location
		origin: self origin
		subdirectory: (self subdirectory ifNil: '')).
	
	_backend frontend: self.
	branchName ifNotNil: [ backend branch: branchName ].
	origin ifNil: [ origin := IceRemoteRepository url: backend remoteUrl ].

	(self location exists not or: [ self location hasChildren not ])
		ifTrue: [ _backend cloneRepository ].

	self backend: _backend
