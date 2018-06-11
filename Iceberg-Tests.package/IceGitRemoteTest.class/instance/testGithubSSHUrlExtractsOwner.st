tests-ssh
testGithubSSHUrlExtractsOwner
	| url |
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url owner equals: 'pharo-vcs'.