tests-scp
testGithubScpUrlExtractsPath
	| url |
	url := IceGitScpRemote new url: 'ssh://git@github.com/pharo-vcs/iceberg.git'.
	self assert: url path asArray equals: #(  )