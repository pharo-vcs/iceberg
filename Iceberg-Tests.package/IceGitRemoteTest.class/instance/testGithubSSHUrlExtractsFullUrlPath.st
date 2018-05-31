tests-ssh
testGithubSSHUrlExtractsFullUrlPath
	| url |
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url projectPath equals: 'pharo-vcs/iceberg'