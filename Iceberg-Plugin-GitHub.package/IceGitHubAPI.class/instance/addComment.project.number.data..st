requesting
addComment: owner project: projectName number: aNumber data: aDictionary
	^ self 
		post: 'repos/', owner, '/', projectName, '/issues/', aNumber asString, '/comments'
		with: [ :client |
			client 
				entity: (ZnEntity text: (STON toJsonString: aDictionary));
				contentType: ZnMimeType applicationJson ]