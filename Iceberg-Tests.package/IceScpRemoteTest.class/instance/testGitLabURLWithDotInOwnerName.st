tests
testGitLabURLWithDotInOwnerName
	| remote |
	remote := IceRemote url: 'git@gitlab.com:the.owner/repo.git'.
	self
		assert: remote host equals: 'gitlab.com';
		assert: remote owner equals: 'the.owner';
		assert: remote path isEmpty;
		assert: remote projectName equals: 'repo'