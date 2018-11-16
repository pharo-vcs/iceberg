tests-scp
testGithubImplicitScpUrlHasDefaultPort
	| url |
	url := IceGitScpRemote new url: 'git@github.com:pharo-vcs/iceberg.git'.
	self assert: url port equals: 22