tests-scp
testCanHandleNonGithubImplicitScpUrl

	self assert: (IceGitScpRemote canHandleUrl: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git')