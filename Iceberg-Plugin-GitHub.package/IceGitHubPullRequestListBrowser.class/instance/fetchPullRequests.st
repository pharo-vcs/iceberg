private
fetchPullRequests
	^ (IceGitHubAPI new
		getPullRequests: self remote entity owner project: self remote entity name) all
		collect: [ :each | 
			(IceGitHubPullRequest fromJSON: each)
				repository: self repository;
				yourself ]