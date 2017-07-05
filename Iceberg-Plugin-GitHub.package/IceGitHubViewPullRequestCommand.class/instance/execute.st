execute
execute
	IceGitHubPullRequestListBrowser new
		remote: self remote;
		pullRequests: self fetchPullRequestsInRemote;
		open