tests-ssh
testNonGithubSSHUrlExtractsPath
	| url |
	url := IceGitSshRemote new url: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url path asArray equals: #( diffuse )