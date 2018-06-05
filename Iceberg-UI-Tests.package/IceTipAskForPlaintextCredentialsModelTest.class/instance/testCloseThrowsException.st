tests - cancel
testCloseThrowsException

	dialog remoteUrl: 'https://github.com/aaa/bbb'. 
	dialog openNonModal. 
	
	self should: [ dialog window close ] raise: LGitNoCredentialsProvided