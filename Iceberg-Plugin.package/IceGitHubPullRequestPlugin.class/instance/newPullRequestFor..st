actions
newPullRequestFor: aRepository 
	(IceGitHubPullRequestModel for: aRepository)
		setModal: true; 
		onAccept: [ :pr | 
			[ 
				pr sendWithCredentials: self plaintextCredentials.
				UIManager default inform: 'Pull request created.' ]
			on: IceGitHubError do: [ :e | self reportError: e ] ];
		openWithSpec 