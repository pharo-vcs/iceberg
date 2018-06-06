fetching
fetch
	
	localRepository handleLibgitError: [
		[ (LGitRemote of: self repositoryHandle named: self name)
			lookup;
			fetchWithCredentials: (IceCredentialsProvider defaultForRemote: self) ]
			on: LGitAbstractError
			do: [ :e | e acceptError: IceLibgitErrorVisitor new ].
		
		"Call post fetch to fix unknown commits"
		localRepository postFetch ]