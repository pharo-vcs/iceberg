tests-ssh
testGithubSSHUrlHasDefaultPort
	| url |
	url := IceGitSshRemote new url: 'git://github.com/pharo-vcs/iceberg.git'.
	self assert: url port equals: 9418