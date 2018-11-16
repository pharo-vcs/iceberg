tests
testExplicitHttpsProtocolUrl

	| url |
	url := IceUrlBuilder new
		protocol: IceHttpsProtocol new;
		host: 'localhost';
		path: 'repo';
		buildUrl.
	
	self assert: url equals: 'https://localhost/repo.git'