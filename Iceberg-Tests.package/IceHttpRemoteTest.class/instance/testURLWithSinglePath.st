tests
testURLWithSinglePath
	|remote|
	remote := self protocolURLFor: 'hostname:8080/path/owner/repo.git'.
	self 
		assert: remote path size equals: 1;
		assert: remote path first equals: 'path'