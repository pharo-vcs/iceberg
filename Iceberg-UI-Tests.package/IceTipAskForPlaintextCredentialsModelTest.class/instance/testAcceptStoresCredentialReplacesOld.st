tests - storing
testAcceptStoresCredentialReplacesOld

	| cred orig |
	
	orig := IcePlaintextCredentials new.
	orig username: 'aUsername'.
	orig password: 'aPassword'.
	dialog remoteHostname: 'github.com'. 
	
	dialog remoteHostname: 'github.com'. 
	dialog openNonModal. 
	
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	dialog storeCheckbox state: true.
	
	dialog window toolbar okAction value.	

	cred := store plaintextCredentialForHostname: 'github.com'.
	self assert: cred username equals: 'bbb'.
	self assert: cred password equals: 'aaa'.		