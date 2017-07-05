private request
requestGitRepositoryInfo
	| remote |
	remote := self headRemote.
	^ IceGitHubAPI new 
		credentials: self credentials;
		getRepository: remote owner 
			project: remote projectBasename
