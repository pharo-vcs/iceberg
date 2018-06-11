tests-scp
testGithubScpUrlHasDefaultPort
	| url |
	url := IceGitScpRemote new url: 'ssh://git@github.com/pharo-vcs/iceberg.git'.
	self assert: url port equals: 22