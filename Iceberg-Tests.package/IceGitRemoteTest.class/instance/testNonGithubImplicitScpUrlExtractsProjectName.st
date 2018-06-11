tests-scp
testNonGithubImplicitScpUrlExtractsProjectName
	| url |
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url projectName equals: 'rdebug'