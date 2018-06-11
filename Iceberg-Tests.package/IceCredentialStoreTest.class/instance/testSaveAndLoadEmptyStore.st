tests - store
testSaveAndLoadEmptyStore

	| newStore cred |
	
	file := FileLocator temp / 'store.fuel'.
	store storeFile: file.
	store saveIntoStore.
	
	newStore := IceCredentialStore new
		storeFile: file;
		loadFromStore;
		yourself.
		
	cred := newStore plaintextCredentialForHostname: 'github.com'.
	self deny: cred isPresent.
		
	