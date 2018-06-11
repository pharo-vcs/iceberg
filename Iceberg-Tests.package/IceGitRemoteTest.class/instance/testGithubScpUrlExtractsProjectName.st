tests-scp
testGithubScpUrlExtractsProjectName
	| url |
	url := IceGitScpRemote new url: 'ssh://git@github.com/pharo-vcs/iceberg.git'.
	self assert: url projectName equals: 'iceberg'