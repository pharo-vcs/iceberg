API-remotes
remoteNamed: aString 
	
	^ self remoteNamed: aString ifAbsent: [ IceRemoteNotFoundError new
		remoteName: aString;
		signal ]