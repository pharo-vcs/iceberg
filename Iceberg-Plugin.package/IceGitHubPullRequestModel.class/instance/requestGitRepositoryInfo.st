private request
requestGitRepositoryInfo
	| remote |
	remote := self repository pushRemote.
	^ IceGitHubAPI new 
		credentials: self credentials;
		requestRepository: remote owner project: remote projectName
