tests
testCanHandleNoScheme
	| url |
	self assert: (IceScpRemote canHandleUrl: 'git@host:owner/repo').
	url := IceScpRemote new
				url: 'git@host:owner/repo'.
	self assert: url owner equals: 'owner'.
	self assert: url projectName equals: 'repo'.