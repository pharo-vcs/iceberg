executing
basicExecute

	credentials := IceGitHubAPI ensureCredentials.

	remote ifNil: [ 
		remote := self repository branch hasUpstream
			ifTrue: [ self repository branch upstream remote ]
			ifFalse: [ self askRemote: self repository ]
	].

	(self validateMakePullRequestOn: self repository) ifFalse: [ ^ #() ].

	(IceGitHubCreatePullRequestModel 
		repository: self repository
		credentials: self credentials
		headRemote: remote)
		onAccept: [ :pullRequest | self sendPullRequest: pullRequest ];
		openModalWithSpec