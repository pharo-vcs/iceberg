actions
viewPullRequest: aPullRequest
	UIManager default 
		informUser: ('Opening pull request {1} {2}' format: { aPullRequest number. aPullRequest title })
		during: [  
			IceGitHubPullRequestBrowser new 
			pullRequest: aPullRequest;
			open ]