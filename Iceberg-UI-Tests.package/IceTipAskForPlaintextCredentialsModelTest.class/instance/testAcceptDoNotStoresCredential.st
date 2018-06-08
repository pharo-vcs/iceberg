tests - storing
testAcceptDoNotStoresCredential

	| cred |
	dialog remoteHostname: 'github.com'. 
	dialog openNonModal. 
	
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	dialog storeCheckbox state: false.
	
	dialog window toolbar okAction value.

	cred := store plaintextCredentialForHostname: 'github.com'.
	self assert: cred username equals: ''.
	self assert: cred password equals: ''.		