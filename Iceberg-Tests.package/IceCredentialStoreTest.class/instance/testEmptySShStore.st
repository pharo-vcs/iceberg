tests
testEmptySShStore

	| cred |
	cred := store sshCredentialForHostname: 'github.com'.
	
	self assert: cred username equals: IceSshCredentials defaultUsername.
	self assert: cred publicKey equals: IceSshCredentials defaultPublicKey.
	self assert: cred privateKey equals: IceSshCredentials defaultPrivateKey.