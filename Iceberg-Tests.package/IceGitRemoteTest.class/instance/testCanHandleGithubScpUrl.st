tests-scp
testCanHandleGithubScpUrl

	self assert: (IceGitScpRemote canHandleUrl: 'ssh://git@github.com/npasserini/iceberg.git').