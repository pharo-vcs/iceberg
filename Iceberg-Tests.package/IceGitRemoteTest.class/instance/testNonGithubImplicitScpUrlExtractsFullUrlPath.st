tests-scp
testNonGithubImplicitScpUrlExtractsFullUrlPath
	| url |
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url projectPath equals: 'diffuse/300/rdebug'