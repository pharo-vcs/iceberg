execute
execute
	IceGitHubPullRequestsBrowser new
		remote: self remote;
		pullRequests: self fetchPullRequestsInRemote;
		open