tests-scp
testNonGithubImplicitScpUrlShouldBeTransformableToHttps
	| url |
	
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url httpsUrl equals: 'https://git.fremont.lamrc.net/diffuse/300/rdebug.git'