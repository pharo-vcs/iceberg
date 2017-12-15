remotes
remoteNamed: aName ifAbsent: aBlockClosure 
	
	| gitRemote |
	[ self withRepoDo: [ :repo | 
		gitRemote := (LGitRemote of: repo named: 'origin') lookup.
		^ (IceGitRemote name: gitRemote remoteName url: gitRemote url)
				localRepository: self;
				yourself ]]
			on: LGitObjectNotInitialized
			do: [ ^ aBlockClosure value ]