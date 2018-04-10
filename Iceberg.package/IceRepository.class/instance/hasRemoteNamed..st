API-remotes
hasRemoteNamed: aString 
	
	self remoteNamed: aString ifAbsent: [ ^ false ].
	^ true