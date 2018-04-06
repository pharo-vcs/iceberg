actions
rejectPullRequest
	IceGitHubRejectPullRequestModel new 
		onAccept: [ :model | 
			IceGitHubAPI ensureCredentials.
			self pullRequest 
				rejectMessage: model message  ];
		openWithSpec