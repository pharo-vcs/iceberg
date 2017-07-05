requesting
putAcceptPullRequest: owner project: projectName number: aNumber data: aDictionary
	^ self 
		put: 'repos/', owner, '/', projectName, '/pulls/', aNumber asString, '/merge'
		with: [ :client |
			client 
				entity: (ZnEntity text: (STON toJsonString: aDictionary));
				contentType: ZnMimeType applicationJson ]