tests
testEmptySShStore

	| cred |
	cred := store sshCredentialForUrl: 'git@github.com:tesonep/blah.git'.
	
	self assert: cred username equals: IceSshCredentials defaultUsername.
	self assert: cred publicKey equals: IceSshCredentials defaultPublicKey.
	self assert: cred privateKey equals: IceSshCredentials defaultPrivateKey.