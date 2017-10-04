tests
testCanHandleSshUrlWithDifferentUser
	| url |
	self assert: (IceScpRemote canHandleUrl: 'ssh://user-name@host:1701/owner/repo').
	url := IceScpRemote new
				url: 'ssh://user-name@host:1701/owner/repo'.
	self assert: url owner equals: 'owner'.
	self assert: url projectName equals: 'repo'.