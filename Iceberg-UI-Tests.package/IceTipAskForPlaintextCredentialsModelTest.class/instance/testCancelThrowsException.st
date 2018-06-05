tests - cancel
testCancelThrowsException

	dialog remoteUrl: 'https://github.com/aaa/bbb'. 
	dialog openNonModal. 
	
	self should: [ dialog window toolbar cancelButton performAction ] raise: LGitNoCredentialsProvided