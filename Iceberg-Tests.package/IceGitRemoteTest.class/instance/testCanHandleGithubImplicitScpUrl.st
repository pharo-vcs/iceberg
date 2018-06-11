tests-scp
testCanHandleGithubImplicitScpUrl

	self assert: (IceGitScpRemote canHandleUrl: 'git@github.com:npasserini/iceberg.git')