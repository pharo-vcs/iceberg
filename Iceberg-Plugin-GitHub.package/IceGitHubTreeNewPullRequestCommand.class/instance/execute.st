execute
execute 

	^ IceGitHubNewPullRequestAction new
		repository: self repository;
		remote: self remote;
		execute.
