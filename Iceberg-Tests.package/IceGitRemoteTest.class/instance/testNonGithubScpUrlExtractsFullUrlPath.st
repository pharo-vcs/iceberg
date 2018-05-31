tests-scp
testNonGithubScpUrlExtractsFullUrlPath
	| url |
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url projectPath equals: 'diffuse/300/rdebug'