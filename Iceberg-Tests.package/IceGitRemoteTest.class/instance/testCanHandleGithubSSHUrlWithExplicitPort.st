tests-ssh
testCanHandleGithubSSHUrlWithExplicitPort
	self assert: (IceGitSshRemote canHandleUrl: 'git://github.com:8372/pharo-vcs/iceberg').