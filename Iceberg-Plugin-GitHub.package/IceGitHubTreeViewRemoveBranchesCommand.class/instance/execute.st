accessing
execute
	^ IceGitHubRemoveBranchesAction new
		repository: self repository;
		remote: self remote;
		execute.
