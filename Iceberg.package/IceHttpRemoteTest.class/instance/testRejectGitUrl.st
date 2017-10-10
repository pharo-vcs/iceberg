tests
testRejectGitUrl
	self deny: (IceHttpRemote canHandleUrl: 'git://github.com/pharo-vcs/tonel').