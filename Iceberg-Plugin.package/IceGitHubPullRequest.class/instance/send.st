actions
send
	| prData response |

	prData := { 
		'title' -> self title.
		'head' -> (self headRemote owner, ':', self headBranchName).
		'base' -> self baseBranchName.
		'body' -> self body.
	} asDictionary.
	
	response := ZnClient new 
		headerAt: 'Accept' put: 'application/vnd.github.v3+json';
		username: self credentials username password: self credentials password;
		url: 'https://api.github.com/repos/', self baseRemote owner, '/', self baseRemote projectName, '/pulls';
		entity: (ZnEntity text: (STON toJsonString: prData));
		contentType: ZnMimeType applicationJson;
		post;
		response.
	
	response isSuccess 
		ifFalse: [ IceGitHubError signalFor: response ]