tests-scp
testGithubImplicitScpUrlExtractsFullUrlPath
	| url |
	url := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: url projectPath equals: 'pharo-vcs/iceberg'