tests-ssh
testGithubSSHUrlExtractsPort
	| url |
	url := IceGitSshRemote new url: 'git://github.com:8372/pharo-vcs/iceberg.git'.
	self assert: url port equals: 8372