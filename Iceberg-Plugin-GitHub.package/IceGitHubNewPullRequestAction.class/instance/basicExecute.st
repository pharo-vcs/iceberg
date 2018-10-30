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
		setModal: true;
		onAccept: [ :pullRequest | 
			[ | pullRequestDatas |
			pullRequestDatas := pullRequest send.
			UIManager default 
				inform: 'Pull request created. Click to view on Github.' 
				actionOnClick: [ self class environment at: #WebBrowser ifPresent: [ :webBrowser | webBrowser openOn: (pullRequestDatas at: 'html_url') ] ifAbsent: [ self inform: 'Feature not available in Pharo 6' ]  ] ]
				on: IceGitHubError
				do: [ :e | self reportError: e ] ];
		openWithSpec