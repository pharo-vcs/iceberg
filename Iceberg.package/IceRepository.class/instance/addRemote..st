API-remotes
addRemote: aRemote  
	"Add a remote to the current repository.
	
	Throw an exception if a remote with the same name already exists"
	
	(self hasRemoteNamed: aRemote name)
		ifTrue: [ IceRemoteAlreadyExistsError new
			remoteName: aRemote name;
			signal ].
	
	self remoteAt: aRemote name put: aRemote.
	aRemote localRepository: self.