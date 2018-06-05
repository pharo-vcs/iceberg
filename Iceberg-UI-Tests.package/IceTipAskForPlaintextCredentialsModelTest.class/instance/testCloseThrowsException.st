running
testCloseThrowsException

	dialog remoteUrl: 'http://github.com/aaa/bbb'. 
	dialog openNonModal. 
	
	self should: [ dialog window close ] raise: LGitNoCredentialsProvided