tests-ssh
testNonGithubSSHUrlHasDefaultPort
	| url |
	url := IceGitSshRemote new url: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git'.
	self assert: url port equals: 9418