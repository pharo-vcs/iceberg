accessing
status
	^ status ifNil: [ 
		status := IceGitHubAPI new 
			get: 'repos/', self owner, '/', self projectName, '/commits/', self headSHA, '/status' ]