actions
acceptPullRequest
	IceGitHubAcceptPullRequestModel new 
		onAccept: [ :model | 
			IceGitHubAPI ensureCredentials.
			self pullRequest 
				acceptMessage: model message 
				type: model type ];
		openWithSpec
	