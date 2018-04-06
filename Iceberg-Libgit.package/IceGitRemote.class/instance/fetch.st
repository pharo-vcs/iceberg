fetching
fetch
	[ (LGitRemote of: self repositoryHandle named: self name)
		lookup;
		fetchWithCredentials: IceCredentialsProvider default ]
		on: LGitAbstractError
		do: [ :e | e acceptError: IceLibgitErrorVisitor new ]