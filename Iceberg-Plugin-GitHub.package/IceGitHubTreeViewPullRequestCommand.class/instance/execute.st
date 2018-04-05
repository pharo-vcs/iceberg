execute
execute
	^ IceGitHubViewPullRequestAction new
		repository: self repository;
		remote: self remote;
		execute.
