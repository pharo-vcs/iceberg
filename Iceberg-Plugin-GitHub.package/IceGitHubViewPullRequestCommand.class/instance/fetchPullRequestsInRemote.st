as yet unclassified
fetchPullRequestsInRemote
	^ (IceGitHubAPI new
		credentials: self credentials;
		requestPullRequests: self remote owner project: self remote projectName) all
		collect: [ :each | 
			(IceGitHubPullRequest fromJSON: each)
				repository: self repository;
				yourself ]