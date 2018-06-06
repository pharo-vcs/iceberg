instance creation
defaultForRemote: aRemote
	^ self providerType new
		remote: aRemote;
		yourself