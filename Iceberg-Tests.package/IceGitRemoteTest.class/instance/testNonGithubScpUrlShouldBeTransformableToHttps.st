tests-scp
testNonGithubScpUrlShouldBeTransformableToHttps
	| url |
	
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url httpsUrl equals: 'https://git.fremont.lamrc.net/diffuse/300/rdebug.git'