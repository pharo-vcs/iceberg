tests
testRejectAbsoluteFilePath
	self deny: (IceScpRemote canHandleUrl: '/Users/foo/bla.git').