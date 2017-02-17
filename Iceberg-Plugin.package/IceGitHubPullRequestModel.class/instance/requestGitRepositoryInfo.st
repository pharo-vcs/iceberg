private request
requestGitRepositoryInfo
	| remote |
	remote := self repository pushRemote.
	^ IceGitHubAPI new 
		credentials: self credentials;
		requestRepositoryFrom: remote owner project: remote projectName
