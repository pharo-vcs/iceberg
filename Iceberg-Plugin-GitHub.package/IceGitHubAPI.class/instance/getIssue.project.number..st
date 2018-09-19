requesting
getIssue: owner project: projectName number: issueNumber
	^ self get: 'repos/', owner,'/', projectName, '/issues/', (issueNumber asString)