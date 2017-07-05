requesting
getPullRequests: owner project: projectName
	^ self getPaginated: 'repos/', owner, '/', projectName, '/pulls'
		