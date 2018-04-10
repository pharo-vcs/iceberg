API-remotes
removeRemote: aRemote
	
	(self hasRemoteNamed: aRemote name)
		ifFalse: [ IceRemoteNotFoundError new
			remoteName: aRemote name;
			signal ].
		
	self doRemoveRemote: aRemote