tests
testCanHandleHttpUrlUsername
	| url |
	self assert: (IceHttpRemote canHandleUrl: 'http://username:password@example.com/owner/repo.git').
	url := IceHttpRemote new
				url: 'http://username:password@example.com/owner/repo.git';
				parseUrl.
	self assert: url projectName equals: 'repo'.
	self assert: url owner equals: 'owner'.
	self assert: url port equals: 80.