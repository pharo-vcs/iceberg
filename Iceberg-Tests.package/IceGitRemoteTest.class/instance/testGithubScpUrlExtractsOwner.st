tests-scp
testGithubScpUrlExtractsOwner
	| url |
	url := IceGitScpRemote new url: 'ssh://git@github.com/pharo-vcs/iceberg.git'.
	self assert: url owner equals: 'pharo-vcs'.