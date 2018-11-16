accessing
newRepository

	|  newRepository |
	newRepository := super newRepository.
	UIManager default 
		informUser: 'Configuring Remotes...'
		during: [ | githubRepository |
			githubRepository := self getGitHubRepository.
			githubRepository ifNil: [ ^ newRepository ].
			(githubRepository at: #fork)
				ifTrue: [ | parent remote |
					parent := githubRepository at: #parent.
					remote := IceGitRemote name: ((parent at: #owner) at: #login) url: (parent at: self selectedProtocol githubRequestUrlKey).
					newRepository addRemote: remote.
					remote fetch. ] ].
	^ newRepository