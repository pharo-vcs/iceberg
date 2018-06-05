running
testCancelThrowsException

	dialog remoteUrl: 'http://github.com/aaa/bbb'. 
	dialog openNonModal. 
	
	self should: [ dialog window toolbar cancelButton performAction ] raise: LGitNoCredentialsProvided