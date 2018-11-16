tests - cancel
testCloseThrowsException

	dialog remoteHostname: 'github.com'. 
	dialog openNonModal. 
	
	self should: [ dialog window close ] raise: LGitNoCredentialsProvided