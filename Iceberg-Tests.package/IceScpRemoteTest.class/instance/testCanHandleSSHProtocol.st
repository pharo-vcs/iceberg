tests
testCanHandleSSHProtocol

	self assert: (IceScpRemote canHandleUrl: 'ssh://github.com:owner/repo.git')