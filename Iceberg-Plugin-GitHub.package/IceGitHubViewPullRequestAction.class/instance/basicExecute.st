executing
basicExecute
	credentials := IceGitHubAPI ensureCredentials.
	
	UIManager default
		informUser: ('Retrieving pull requests from {1}' format: {self remote})
		during: [ (IceTipGitHubPullRequestListBrowser onRepository: self repository)
				remote: self remote;
				refreshPullRequests;
				openWithSpec ]