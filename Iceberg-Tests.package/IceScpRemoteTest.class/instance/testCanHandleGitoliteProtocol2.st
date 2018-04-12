tests
testCanHandleGitoliteProtocol2		
	self assert: (IceGitScpRemote canHandleUrl: self gitoliteUrl2)