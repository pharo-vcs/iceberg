tests - store
testStorePlainTextSavingInFile

	| cred orig newStore |
	
	orig := IcePlaintextCredentials new.
	orig username: 'aUsername'.
	orig password: 'aPassword'.

	file := FileLocator temp / 'store.fuel'.
	store storeFile: file.

	store storeCredential: orig forHostname: 'github.com'.
	
	newStore := IceCredentialStore new
		storeFile: file;
		loadFromStore;
		yourself.
		
	cred := newStore plaintextCredentialForHostname: 'github.com'.
	
	self assert: cred username equals: 'aUsername'.
	self assert: cred password equals: 'aPassword'.
