tests - storing
testAcceptStoresCredential

	| cred |
	dialog remoteUrl: 'https://github.com/aaa/bbb'. 
	dialog openNonModal. 
	
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	dialog storeCheckbox state: true.
	
	dialog window toolbar okAction value.	

	cred := store plaintextCredentialForUrl: 'https://github.com'.
	self assert: cred username equals: 'bbb'.
	self assert: cred password equals: 'aaa'.		