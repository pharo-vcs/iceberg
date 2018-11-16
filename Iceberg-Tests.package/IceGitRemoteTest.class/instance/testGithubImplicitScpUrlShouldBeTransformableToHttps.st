tests-scp
testGithubImplicitScpUrlShouldBeTransformableToHttps

	| remote |
	remote := IceGitScpRemote new url: 'git@github.com:npasserini/iceberg.git'.
	self assert: remote httpsUrl equals: 'https://github.com/npasserini/iceberg.git'