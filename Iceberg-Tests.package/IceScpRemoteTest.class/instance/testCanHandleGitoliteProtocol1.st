tests
testCanHandleGitoliteProtocol1
	self assert: (IceScpRemote canHandleUrl: self gitoliteUrl1)