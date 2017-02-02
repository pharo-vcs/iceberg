private request
requestGitRepositoryInfo
	| remote |
	remote := self repository pushRemote.
	^ ZnClient new 
	username: self credentials username password: self credentials password; 
	headerAt: 'Accept' put: 'application/vnd.github.v3+json';
	url: 'https://api.github.com/repos/', remote owner,'/', remote projectName;
	get