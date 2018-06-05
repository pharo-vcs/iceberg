tests
testEmptyStore

	| cred |
	cred := store plaintextCredentialForUrl: 'http://github.com/blah/blah'.
	self deny: cred isPresent.