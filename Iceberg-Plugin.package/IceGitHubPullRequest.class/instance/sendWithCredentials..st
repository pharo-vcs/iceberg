actions
sendWithCredentials: credentials
	| prData remotes headRemote baseRemote response |

	remotes := self head repository remotes.
	headRemote := remotes detect: [ :each | each remoteName = self head remoteName ].
	baseRemote := remotes detect: [ :each | each remoteName = self base remoteName ].
	prData := { 
		'title' -> self title.
		'head' -> (headRemote owner, ':', self head basename).
		'base' -> self base basename.
		'body' -> self body.
	} asDictionary.
	
	response := ZnClient new 
		headerAt: 'Accept' put: 'application/vnd.github.v3+json';
		username: credentials username password: credentials password;
		url: 'https://api.github.com/repos/', baseRemote owner, '/', baseRemote projectName, '/pulls';
		entity: (ZnEntity text: (STON toJsonString: prData));
		contentType: ZnMimeType applicationJson;
		post;
		response.
	
	response isSuccess 
		ifFalse: [ IceGitHubError signalFor: response ]