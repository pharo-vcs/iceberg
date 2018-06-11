instance creation
defaultForHost: aString
	
	^ self defaultForRemote: (IceRemoteWithOnlyHostname for: aString)
