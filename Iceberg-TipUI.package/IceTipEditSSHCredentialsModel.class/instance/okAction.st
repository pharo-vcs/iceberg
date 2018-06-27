actions
okAction
	self credentials
		username: self username;
		publicKey: self publicKey;
		privateKey: self privateKey;
		keyPassphrase: self passphrase.		
		
	credentialStore storeCredential: self credentials.
	tool ifNotNil: #refresh.
	
	accepted := true.
	
	^ self credentials.