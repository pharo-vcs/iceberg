tests - storing
testAcceptDoNotStoresCredential

	| cred |
	dialog remoteUrl: 'https://github.com/aaa/bbb'. 
	dialog openNonModal. 
	
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	dialog storeCheckbox state: false.
	
	dialog window toolbar okAction value.

	cred := store plaintextCredentialForUrl: 'https://github.com'.
	self assert: cred username equals: ''.
	self assert: cred password equals: ''.		