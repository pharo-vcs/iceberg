tests-scp
testGithubScpUrlShouldBeTransformableToHttps

	| remote |
	remote := IceGitScpRemote new url: 'ssh://git@github.com/npasserini/iceberg.git'.
	self assert: remote httpsUrl equals: 'https://github.com/npasserini/iceberg.git'