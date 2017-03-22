tests
testCanHandleGitProtocol

	self assert: (IceScpRemote canHandleUrl: 'git@github.com:owner/repo.git')