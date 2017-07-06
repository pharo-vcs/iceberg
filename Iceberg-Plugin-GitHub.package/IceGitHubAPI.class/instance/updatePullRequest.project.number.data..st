requesting
updatePullRequest: owner project: projectName number: aNumber data: aDictionary 
	^ self 
		patch: 'repos/', owner, '/', projectName, '/pulls/', aNumber asString
		with: [ :client |
			client 
				entity: (ZnEntity text: (STON toJsonString: aDictionary));
				contentType: ZnMimeType applicationJson ]