accessing
detail
	^ detail ifNil: [
		detail := IceGitHubAPI new get: ((self jsonAt: #url) allButFirst: 23) ]