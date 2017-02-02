private request
requestBaseBranches
	^ ZnClient new 
	username: self credentials username password: self credentials password; 
	headerAt: 'Accept' put: 'application/vnd.github.v3+json';
	url: 'https://api.github.com/repos/', self baseRemote owner,'/', self baseRemote projectName, '/branches';
	get	