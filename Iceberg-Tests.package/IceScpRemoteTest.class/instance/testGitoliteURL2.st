tests
testGitoliteURL2
	| remote |
	remote := IceGitRemote url: self gitoliteUrl2.
	self
		assert: remote host equals: 'server.bogus.edu';
		assert: remote owner equals: nil;
		assert: remote path isEmpty;
		assert: remote projectName equals: 'reponame'