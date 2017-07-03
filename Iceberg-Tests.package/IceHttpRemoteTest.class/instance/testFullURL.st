tests
testFullURL
	| remote |
	remote := self protocolURLFor: 'user@hostname.com:1234/subpath1/subpath2/owner/repo.git'.
	self
		assert: remote host equals: 'hostname.com';
		assert: remote port equals: 1234;
		assert: remote owner equals: 'owner';
		assert: remote projectName equals: 'repo'