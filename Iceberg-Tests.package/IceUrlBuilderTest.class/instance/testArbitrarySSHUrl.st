tests
testArbitrarySSHUrl

	| url |
	url := IceUrlBuilder new
		beSsh;
		host: 'localhost';
		path: 'repo';
		buildUrl.
	
	self assert: url equals: 'git@localhost:repo.git'