tests
testAcceptEnabledAndDisabled

	dialog remoteHostname: 'github.com'. 
	dialog openNonModal. 
	
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	self assert: dialog window toolbar okButton enabled.
	
	dialog passwordInput text: ''.
	dialog usernameInput text: 'bbb'.

	self deny: dialog window toolbar okButton enabled.

	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: ''.

	self deny: dialog window toolbar okButton enabled.

	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	self assert: dialog window toolbar okButton enabled.
