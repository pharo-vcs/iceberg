requesting
requestPullRequests: owner project: projectName
	^ self getPaginated: 'repos/', owner, '/', projectName, '/pulls'
		