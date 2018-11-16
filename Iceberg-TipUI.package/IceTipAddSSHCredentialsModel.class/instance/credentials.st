accessing
credentials
	
	^ IceSshCredentials new
		username: self username;
		publicKey: self publicKey;
		privateKey: self privateKey;
		keyPassphrase: self passphrase;
		yourself 