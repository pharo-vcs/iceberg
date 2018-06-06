tests
testAcceptCreatesCredential

	| cred |
	dialog remoteHostname: 'github.com'. 
	dialog openNonModal. 
	
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	cred := dialog window toolbar okAction value.	

	self assert: cred username equals: 'bbb'.
	self assert: cred password equals: 'aaa'.	