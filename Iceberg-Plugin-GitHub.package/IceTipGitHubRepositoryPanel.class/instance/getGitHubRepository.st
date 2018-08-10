querying-github
getGitHubRepository
	[ ^ IceGitHubAPI new
		beAnonymous;
		getRepository: self userName project: self projectName ]
		on: LGitNoCredentialsProvided
		do: [ ^ nil ]