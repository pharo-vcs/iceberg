tests-ssh
testGithubSSHUrlExtractsProjectName
	| url |
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url projectName equals: 'iceberg'