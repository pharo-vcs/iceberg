actions
rejectPullRequest
	IceGitHubRejectPullRequestModel new 
		onAccept: [ :model | 
			self pullRequest 
				rejectMessage: model message  ];
		openWithSpec