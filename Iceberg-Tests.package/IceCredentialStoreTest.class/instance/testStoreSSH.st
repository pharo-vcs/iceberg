tests
testStoreSSH

	| cred orig |
	
	orig := IceSshCredentials new.
	orig username: 'aUsername'.
	orig keyPassphrase: 'aPassword'.
	orig publicKey: 'aPublicKey.id'.
	orig privateKey: 'aPrivateKey.id'.

	store storeCredential: orig forHostname: 'github.com'.
	
	cred := store sshCredentialForHostname: 'github.com'.
	
	self assert: cred username equals: 'aUsername'.
	self assert: cred publicKey equals: 'aPublicKey.id'.
	self assert: cred privateKey equals: 'aPrivateKey.id'.
	self assert: cred keyPassphrase equals: 'aPassword'.	