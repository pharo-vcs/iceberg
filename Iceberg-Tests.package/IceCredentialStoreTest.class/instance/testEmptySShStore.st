tests
testEmptySShStore

	| cred |
	cred := store sshCredentialForUrl: 'https://github.com/blah/blah'.
	
	self assert: cred username equals: IceSshCredentials defaultUsername.
	self assert: cred publicKey equals: IceSshCredentials defaultPublicKey.
	self assert: cred privateKey equals: IceSshCredentials defaultPrivateKey.