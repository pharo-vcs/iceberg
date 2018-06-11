fetching
fetchBranch: aBranch
	
	localRepository handleLibgitError: [
		[ | refSpec remote |
		refSpec := LGitRefSpec
			fromString:
				('{2}:refs/remotes/{1}/{2}'
					format:
						{self name.
						aBranch name}).
		(remote := LGitRemote of: self repositoryHandle named: self name)
			lookup;
			fetchWithCredentials: (IceCredentialsProvider defaultForRemote: self) refSpec: refSpec ]
			on: LGitAbstractError
			do: [ :e | e acceptError: (IceLibgitErrorVisitor onContext: self) ] ]