tests
testLookupHostname

	| cred orig |
	
	orig := IcePlaintextCredentials new.
	orig username: 'aUsername'.
	orig password: 'aPassword'.

	store storeCredential: orig forHostname: 'github.com'.
	
	cred := store plaintextCredentialForHostname: 'github.com'.
	
	self assert: cred username equals: 'aUsername'.
	self assert: cred password equals: 'aPassword'.
