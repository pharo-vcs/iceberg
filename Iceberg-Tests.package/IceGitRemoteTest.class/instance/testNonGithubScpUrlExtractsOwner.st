tests-scp
testNonGithubScpUrlExtractsOwner
	| url |
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url owner equals: '300'.