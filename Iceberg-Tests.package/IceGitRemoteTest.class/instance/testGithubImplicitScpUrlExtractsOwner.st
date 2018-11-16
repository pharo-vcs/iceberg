tests-scp
testGithubImplicitScpUrlExtractsOwner
	| url |
	url := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: url owner equals: 'pharo-vcs'.