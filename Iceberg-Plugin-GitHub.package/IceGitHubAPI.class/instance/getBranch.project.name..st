requesting
getBranch: owner project: projectName name: branchName
	^ self get: 'repos/', owner,'/', projectName, '/branches/', branchName