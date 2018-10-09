instance creation
defaultForRemoteUrl: url
	^ self providerType new
		remote: (IceGitRemote url: url);
		yourself