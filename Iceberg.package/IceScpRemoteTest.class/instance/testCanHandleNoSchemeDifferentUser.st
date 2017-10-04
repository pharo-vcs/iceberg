tests
testCanHandleNoSchemeDifferentUser
	| url |
	self assert: (IceScpRemote canHandleUrl: 'username@host:owner/repo').
	url := IceScpRemote new
				url: 'username@host:owner/repo'.
	self assert: url owner equals: 'owner'.
	self assert: url projectName equals: 'repo'.