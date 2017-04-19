tests
testLocalhostRepo
	|remote|
	remote := self protocolURLFor: 'hostname/owner/repo.git'.
	self 
		assert: remote host equals: 'hostname';
		assert: remote owner equals: 'owner';		
		assert: remote port equals: self defaultTestClass defaultPort;	
		assert: remote projectName equals: 'repo.git'