tests - store
testStoreInNonExistingDirectory

	| newStore cred otherStore |
	
	dir := FileLocator temp / 'nonExisting'.	
	file := FileLocator temp / 'nonExisting' / 'nonExisting.fuel'.
	
	self deny: dir exists.
	
	newStore := IceCredentialStore new
		storeFile: file;
		saveIntoStore;
		yourself.

	newStore storeCredential: (IcePlaintextCredentials new
		host: 'github.com';
		password: 'aasd';
		username: 'aaa';
		yourself).

	otherStore := IceCredentialStore new
		storeFile: file;
		loadFromStore;
		yourself.
		
	cred := otherStore plaintextCredentialForHostname: 'github.com'.
	self assert: cred isPresent.
		
	