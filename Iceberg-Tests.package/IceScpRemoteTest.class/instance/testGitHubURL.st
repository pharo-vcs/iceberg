tests
testGitHubURL
	| remote |
	remote := IceRemote url: 'git@github.com:owner/repo.git'.
	self 
		assert: remote host equals: 'github.com';
		assert: remote owner equals: 'owner';
		assert: remote path isEmpty;
		assert: remote projectName equals: 'repo'.