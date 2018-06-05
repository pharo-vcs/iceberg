tests
testStorePlainText

	| cred orig |
	
	orig := IcePlaintextCredentials new.
	orig username: 'aUsername'.
	orig password: 'aPassword'.

	store storeCredential: orig forUrl: 'https://github.com/blah/blah'.
	
	cred := store plaintextCredentialForUrl: 'https://github.com/blah/blah'.
	
	self assert: cred username equals: 'aUsername'.
	self assert: cred password equals: 'aPassword'.
