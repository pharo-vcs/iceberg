tests
testCanHandleGitProtocol

	self assert: (IceGitScpRemote canHandleUrl: 'git@github.com:owner/repo.git')