accessing
credentials: aValue
	
	credentials := aValue.
	
	usernameInput text: credentials username.
	passphraseInput text: credentials keyPassphrase.
	passphraseInput encrypted: false.
	privateKeyInput location: credentials privateKey.
	publicKeyInput location: credentials publicKey.

