tests - providers
testBitBucketURL
	|remote|
	remote := self protocolURLFor: 'bitbucket.org/owner/repo.git'.
	self 
		assert: remote host equals: 'bitbucket.org';
		assert: remote owner equals: 'owner';	
		assert: remote path isEmpty;
		assert: remote projectName equals: 'repo'