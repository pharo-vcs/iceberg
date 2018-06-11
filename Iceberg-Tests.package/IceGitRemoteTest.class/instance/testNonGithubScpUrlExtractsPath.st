tests-scp
testNonGithubScpUrlExtractsPath
	| url |
	url := IceGitScpRemote new url: 'ssh://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url path asArray equals: #( diffuse )