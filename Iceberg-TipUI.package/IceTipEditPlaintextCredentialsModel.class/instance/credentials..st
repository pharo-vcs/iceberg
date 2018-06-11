accessing
credentials: aPlainTextCredential 

	credential := aPlainTextCredential.
	
	self usernameInput text: credential username.
	self passwordInput text: credential password.
	