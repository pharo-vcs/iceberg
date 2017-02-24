tests - providers
testGitHubURL
	|remote|
	remote := self protocolURLFor: 'github.com/owner/repo.git'.
	self 
		assert: remote host equals: 'github.com';
		assert: remote owner equals: 'owner';	
		assert: remote path isEmpty;
		assert: remote projectName equals: 'repo.git'