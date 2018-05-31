tests-scp
testGithubImplicitScpUrlExtractsProjectName
	| url |
	url := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: url projectName equals: 'iceberg'