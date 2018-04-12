tests
testCanHandleGitoliteProtocol1		
	self assert: (IceGitScpRemote canHandleUrl: self gitoliteUrl1)