tests-ssh
testNonGithubSSHUrlExtractsPort
	| url |
	url := IceGitSshRemote new url: 'git://git.fremont.lamrc.net:8372/diffuse/300/rdebug.git'.
	self assert: url port equals: 8372