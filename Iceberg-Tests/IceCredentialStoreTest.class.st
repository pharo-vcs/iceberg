Class {
	#name : 'IceCredentialStoreTest',
	#superclass : 'TestCase',
	#instVars : [
		'store',
		'file',
		'dir'
	],
	#category : 'Iceberg-Tests-Security',
	#package : 'Iceberg-Tests',
	#tag : 'Security'
}

{ #category : 'running' }
IceCredentialStoreTest >> setUp [
	super setUp.
	store := IceCredentialStore new
]

{ #category : 'running' }
IceCredentialStoreTest >> tearDown [
	file ifNotNil: [ file ensureDelete ].
	dir ifNotNil: [ dir ensureDeleteAll ].
	super tearDown

]

{ #category : 'tests' }
IceCredentialStoreTest >> testEmptySShStore [

	| cred |
	cred := store sshCredentialForHostname: 'github.com'.
	
	self assert: cred username equals: IceSshCredentials defaultUsername.
	self assert: cred publicKey equals: IceSshCredentials defaultPublicKey.
	self assert: cred privateKey equals: IceSshCredentials defaultPrivateKey.
]

{ #category : 'tests' }
IceCredentialStoreTest >> testEmptyStore [

	| cred |
	cred := store plaintextCredentialForHostname: 'github.com'.
	self deny: cred isPresent.
]

{ #category : 'tests - store' }
IceCredentialStoreTest >> testLoadNonExistingFile [

	| newStore cred |
	
	file := FileLocator temp / 'nonExisting.fuel'.
	
	newStore := IceCredentialStore new
		storeFile: file;
		loadFromStore;
		yourself.
		
	cred := newStore plaintextCredentialForHostname: 'github.com'.
	self deny: cred isPresent.
		
	
]

{ #category : 'tests' }
IceCredentialStoreTest >> testLookupHostname [

	| cred orig |
	
	orig := IcePlaintextCredentials new.
	orig username: 'aUsername'.
	orig password: 'aPassword'.

	store storeCredential: orig forHostname: 'github.com'.
	
	cred := store plaintextCredentialForHostname: 'github.com'.
	
	self assert: cred username equals: 'aUsername'.
	self assert: cred password equals: 'aPassword'.

]

{ #category : 'tests - store' }
IceCredentialStoreTest >> testSaveAndLoadEmptyStore [

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
		
	
]

{ #category : 'tests - store' }
IceCredentialStoreTest >> testStoreInNonExistingDirectory [

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
		
	
]

{ #category : 'tests - store' }
IceCredentialStoreTest >> testStoreInNonExistingFile [

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
		
	
]

{ #category : 'tests' }
IceCredentialStoreTest >> testStorePlainText [

	| cred orig |
	
	orig := IcePlaintextCredentials new.
	orig username: 'aUsername'.
	orig password: 'aPassword'.

	store storeCredential: orig forHostname: 'github.com'.
	
	cred := store plaintextCredentialForHostname: 'github.com'.
	
	self assert: cred username equals: 'aUsername'.
	self assert: cred password equals: 'aPassword'.

]

{ #category : 'tests - store' }
IceCredentialStoreTest >> testStorePlainTextSavingInFile [

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

]

{ #category : 'tests' }
IceCredentialStoreTest >> testStoreSSH [

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
]

{ #category : 'tests - store' }
IceCredentialStoreTest >> testStoreToken [

	| original |
	original := IceTokenCredentials new.
	original
		username: self usernameForTesting;
		token: self tokenForTesting.

	store storeCredential: original forHostname: 'github.com'.
	
	self assert: (store allCredentials anySatisfy: [:each |
		each class = IceTokenCredentials and: [
		each host = 'github.com' and: [
		each username = self usernameForTesting and: [
		each token = self tokenForTesting ] ] ] ]).

]

{ #category : 'tests - store' }
IceCredentialStoreTest >> testStoreTokenSavingInFile [

	| original newStore |
	original := IceTokenCredentials new.
	original
		username: self usernameForTesting;
		token: self tokenForTesting.

	file := FileLocator temp / 'store.fuel'.
	store storeFile: file.

	store storeCredential: original forHostname: 'github.com'.
	
	newStore := IceCredentialStore new
		storeFile: file;
		loadFromStore;
		yourself.
		
	self assert: (newStore allCredentials anySatisfy: [:each |
		each class = IceTokenCredentials and: [
		each host = 'github.com' and: [
		each username = self usernameForTesting and: [
		each token = self tokenForTesting ] ] ] ]).

]

{ #category : 'tests - store' }
IceCredentialStoreTest >> tokenForTesting [

	^ 'e72e16c7e42f292c6912e7710c838347ae178b4a'
]

{ #category : 'tests - store' }
IceCredentialStoreTest >> usernameForTesting [

	^ 'aUsername'
]
