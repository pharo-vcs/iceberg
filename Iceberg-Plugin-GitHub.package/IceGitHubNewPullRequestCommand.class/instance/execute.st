execute
execute 

	^ IceGitHubNewPullRequestAction new
		repository: self repository;
		execute.
