accessing remotes
addRemote: aRemote  
	
	(self hasRemoteNamed: aRemote name)
		ifTrue: [ IceRemoteAlreadyExistsError new
			remoteName: aRemote name;
			signal ].
	
	self remoteAt: aRemote name put: aRemote.
	aRemote localRepository: self.