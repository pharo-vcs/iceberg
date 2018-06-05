instance creation
defaultForRemoteURL: aRemote
	^ self providerType new
		remoteURL: aRemote;
		yourself