tests
testURLWithEmpty
	|remote|
	remote := self protocolURLFor: 'hostname:8080/owner/repo.git'.
	self 
		assert: remote path isEmpty 