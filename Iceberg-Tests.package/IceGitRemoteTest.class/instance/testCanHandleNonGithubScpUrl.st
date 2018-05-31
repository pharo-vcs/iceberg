tests-scp
testCanHandleNonGithubScpUrl

	self assert: (IceGitScpRemote canHandleUrl: 'ssh://git@git.fremont.lamrc.net/diffuse/300/rdebug.git').