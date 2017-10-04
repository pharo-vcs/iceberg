tests
testCanHandleSshUrlWithPort
	| url |
	self assert: (IceScpRemote canHandleUrl: 'ssh://git@host:1701/owner/repo').
	url := IceScpRemote new
				url: 'ssh://git@host:1701/owner/repo'.
	self assert: url owner equals: 'owner'.
	self assert: url projectName equals: 'repo'.