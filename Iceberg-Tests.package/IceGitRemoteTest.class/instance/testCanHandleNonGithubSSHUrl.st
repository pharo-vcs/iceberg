tests-ssh
testCanHandleNonGithubSSHUrl

	self assert: (IceGitSshRemote canHandleUrl: 'git://git.fremont.lamrc.net/diffuse/300/rdebug.git').