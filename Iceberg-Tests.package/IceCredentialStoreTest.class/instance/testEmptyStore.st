tests
testEmptyStore

	| cred |
	cred := store plaintextCredentialForHostname: 'github.com'.
	self deny: cred isPresent.