tests
testArbitraryHttpsUrl

	| url |
	url := IceUrlBuilder new
		beHttps;
		host: 'localhost';
		path: 'repo';
		buildUrl.
	
	self assert: url equals: 'https://localhost/repo.git'