tests-scp
testNonGithubImplicitScpUrlExtractsPath
	| url |
	url := IceGitScpRemote new url: 'git@git.fremont.lamrc.net:diffuse/300/rdebug.git'.
	self assert: url path equals: #( diffuse )