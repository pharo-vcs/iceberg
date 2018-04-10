tests
testGitoliteURL1
	| remote |
	remote := IceRemote url: self gitoliteUrl1.
	self
		assert: remote host equals: 'server.bogus.edu';
		assert: remote owner equals: nil;
		assert: remote path isEmpty;
		assert: remote projectName equals: 'reponame'