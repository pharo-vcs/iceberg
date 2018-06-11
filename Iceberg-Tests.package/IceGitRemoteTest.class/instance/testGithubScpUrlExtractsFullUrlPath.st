tests-scp
testGithubScpUrlExtractsFullUrlPath
	| url |
	url := IceGitScpRemote new url: 'ssh://git@github.com/pharo-vcs/iceberg.git'.
	self assert: url projectPath equals: 'pharo-vcs/iceberg'