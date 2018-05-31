tests-scp
testNonGithubScpUrlHasDefaultPort
	| url |
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url port equals: 22