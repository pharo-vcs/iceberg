tests
testAcceptIsBlockedInTheBeginning

	dialog remoteHostname: 'github.com'. 
	dialog openNonModal. 
	
	self deny: dialog window toolbar okButton enabled.