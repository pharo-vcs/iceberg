querying-github
getGitHubRepository
	"It will retry 3 times"
	1 to: 3 do: [ :attempt | 
		[ [ ^ IceGitHubAPI new
				beAnonymous;
				getRepository: self userName project: self projectName ]
			on: IceAuthenticationError do: [ "I will retry." ] ]
			on: LGitNoCredentialsProvided do: [ ^ nil ] ].
	^ nil