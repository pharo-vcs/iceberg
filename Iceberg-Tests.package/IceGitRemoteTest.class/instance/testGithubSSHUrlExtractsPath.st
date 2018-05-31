tests-ssh
testGithubSSHUrlExtractsPath
	| url |
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url path equals: OrderedCollection new