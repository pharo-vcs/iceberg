tests - store
testLoadNonExistingFile

	| newStore cred |
	
	file := FileLocator temp / 'nonExisting.fuel'.
	
	newStore := IceCredentialStore new
		storeFile: file;
		loadFromStore;
		yourself.
		
	cred := newStore plaintextCredentialForHostname: 'github.com'.
	self deny: cred isPresent.
		
	