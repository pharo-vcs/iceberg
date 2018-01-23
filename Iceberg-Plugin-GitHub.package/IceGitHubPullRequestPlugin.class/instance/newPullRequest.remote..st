actions
newPullRequest: aRepository remote: aRemoteModel
	(IceGitHubNewPullRequestCommand repository: aRepository) 
		remote: aRemoteModel entity;
		execute