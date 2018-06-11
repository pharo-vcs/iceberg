tests-ssh
testCanHandleGithubSSHUrl

	self assert: (IceGitSshRemote canHandleUrl: 'git://github.com/pharo-vcs/iceberg.git')