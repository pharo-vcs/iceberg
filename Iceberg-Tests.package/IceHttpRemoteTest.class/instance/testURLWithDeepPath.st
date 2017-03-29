tests
testURLWithDeepPath
	|remote|
	remote := self protocolURLFor: 'hostname:8080/sub1/sub2/sub3/owner/repo.git'.
	self 
		assert: remote path size equals: 3;
		assert: remote path first equals: 'sub1';
		assert: remote path second equals: 'sub2';	
		assert: remote path third equals: 'sub3'