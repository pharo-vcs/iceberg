accessing
newRepository

	| repository |
	repository := super newRepository.
	UIManager default 
		informUser: 'Configuring Remotes...'
		during: [ | githubRepository |
			githubRepository := IceGitHubAPI new getRepository: self userName project: self projectName.
			(githubRepository at: #fork)
				ifTrue: [ | parent remote |
					parent := githubRepository at: #parent.
					remote := IceGitRemote name: ((parent at: #owner) at: #login) url: (parent at: #'git_url').
					repository addRemote: remote.
					remote fetch. ] ].
	^ repository