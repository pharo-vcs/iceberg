tests
testExplicitSSHProtocolUrl

	| url |
	url := IceUrlBuilder new
		protocol: IceSSHProtocol new;
		host: 'localhost';
		path: 'repo';
		buildUrl.
	
	self assert: url equals: 'git@localhost:repo.git'