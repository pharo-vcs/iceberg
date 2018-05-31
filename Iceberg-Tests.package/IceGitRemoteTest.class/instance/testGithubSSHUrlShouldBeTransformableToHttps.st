tests-ssh
testGithubSSHUrlShouldBeTransformableToHttps
	| url |
	
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url httpsUrl equals: 'https://github.com/pharo-vcs/iceberg.git'