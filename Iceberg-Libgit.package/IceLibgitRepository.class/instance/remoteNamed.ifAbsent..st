remotes
remoteNamed: aName ifAbsent: aBlockClosure
	| gitRemote |
	[ gitRemote := (LGitRemote of: self repositoryHandle named: aName) lookup.
	^ (IceGitRemote name: gitRemote remoteName url: gitRemote url)
		localRepository: self;
		yourself ]
		on: LGitObjectNotInitialized
		do: [ ^ aBlockClosure value ]