actions
acceptPullRequest
	IceGitHubAcceptPullRequestModel new 
		onAccept: [ :model | 
			self pullRequest 
				acceptMessage: model message 
				type: model type ];
		openWithSpec
	