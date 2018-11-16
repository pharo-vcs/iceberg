tests-scp
testNonGithubImplicitScpUrlHasDefaultPort
	| url |
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url port equals: 22