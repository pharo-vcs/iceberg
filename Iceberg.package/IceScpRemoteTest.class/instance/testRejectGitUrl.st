tests
testRejectGitUrl
	self deny: (IceScpRemote canHandleUrl: 'git://github.com/pharo-vcs/tonel').