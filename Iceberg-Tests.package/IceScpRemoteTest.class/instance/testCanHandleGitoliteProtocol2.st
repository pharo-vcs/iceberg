tests
testCanHandleGitoliteProtocol2
	self assert: (IceScpRemote canHandleUrl: self gitoliteUrl2)