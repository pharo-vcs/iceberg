tests
testCanHandleSshUrl
	| url |
	self assert: (IceScpRemote canHandleUrl: 'ssh://git@host:owner/repo').
	url := IceScpRemote new
				url: 'ssh://git@host:owner/repo'.
	self assert: url owner equals: 'owner'.
	self assert: url projectName equals: 'repo'.