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
			[ | pullRequestDatas url |
			pullRequestDatas := pullRequest send.
			url := pullRequestDatas at: 'html_url'.
			UIManager default 
				inform: 'Pull request created. Click to view on Github.' 
				actionOnClick: [ self class environment at: #WebBrowser ifPresent: [ :webBrowser | webBrowser openOn: url ] ifAbsent: [ self inform: ('Cannot open "{1}" because the project WebBrowser is not present by default in Pharo 6.' format: { url }) ]  ] ]
				on: IceGitHubError
				do: [ :e | self reportError: e ] ];
		openWithSpec