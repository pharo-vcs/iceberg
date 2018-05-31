tests-scp
testGithubImplicitScpUrlExtractsPath
	| url |
	url := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: url path equals: #(  )