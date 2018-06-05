tests
testAcceptIsBlockedInTheBeginning

	dialog remoteUrl: 'https://github.com/aaa/bbb'. 
	dialog openNonModal. 
	
	self deny: dialog window toolbar okButton enabled.