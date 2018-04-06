executing
basicExecute
	credentials := IceGitHubAPI ensureCredentials.

	UIManager default 
		informUser: ('Retrieving pull requests from {1}' format: { self remote })  
		during: [ 
			IceGitHubPullRequestListBrowser new
				repository: self repository;
				remote: self remote;
				refreshPullRequests;
				open ]