tests - store
testStoreInNonExistingFile

	| newStore cred otherStore |
	
	file := FileLocator temp / 'nonExisting.fuel'.
	
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
		
	