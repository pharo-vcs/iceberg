actions
viewPullRequest: aRepository remote: aRemote
	(IceGitHubViewPullRequestCommand repository: aRepository) 
		remote: aRemote;
		execute