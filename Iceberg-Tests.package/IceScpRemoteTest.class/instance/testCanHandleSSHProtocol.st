tests
testCanHandleSSHProtocol

	self assert: (IceGitScpRemote canHandleUrl: 'ssh://github.com:owner/repo.git')