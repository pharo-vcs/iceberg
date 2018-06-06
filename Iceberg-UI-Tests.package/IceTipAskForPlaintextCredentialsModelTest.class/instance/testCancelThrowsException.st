tests - cancel
testCancelThrowsException

	dialog remoteHostname: 'github.com'. 
	dialog openNonModal. 
	
	self should: [ dialog window toolbar cancelButton performAction ] raise: LGitNoCredentialsProvided