private
fetchPullRequests
	^ (IceGitHubAPI new
		getPullRequests: self remote owner project: self remote projectName) all
		collect: [ :each | 
			(IceGitHubPullRequest fromJSON: each)
				repository: self repository;
				yourself ]