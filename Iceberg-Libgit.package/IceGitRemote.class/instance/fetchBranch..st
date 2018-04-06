fetching
fetchBranch: aBranch
	[ | refSpec |
	refSpec := LGitRefSpec
		fromString:
			('{2}:refs/remotes/{1}/{2}'
				format:
					{self name.
					aBranch name}).
	(LGitRemote of: self repositoryHandle named: self name)
		lookup;
		fetchWithCredentials: IceCredentialsProvider default refSpec: refSpec ]
		on: LGitAbstractError
		do: [ :e | e acceptError: IceLibgitErrorVisitor new ]