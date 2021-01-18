Class {
	#name : #IceTipAskForPlaintextCredentialsModelTest,
	#superclass : #TestCase,
	#instVars : [
		'store',
		'dialog'
	],
	#category : #'Iceberg-UI-Tests'
}

{ #category : #running }
IceTipAskForPlaintextCredentialsModelTest >> setUp [
	super setUp.
	store := IceCredentialStore new.
	dialog := IceTipAskForPlaintextCredentialsModel new
		credentialStore: store;
		yourself
]

{ #category : #running }
IceTipAskForPlaintextCredentialsModelTest >> tearDown [
	dialog ifNotNil: [ [dialog window close] on: LGitNoCredentialsProvided do: [  ] ].
]

{ #category : #tests }
IceTipAskForPlaintextCredentialsModelTest >> testAcceptCreatesCredential [

	| cred |
	dialog askingHostname: 'github.com'. 
	dialog openNonModal. 
	
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	dialog window triggerOkAction.
	cred := dialog credentials.

	self assert: cred username equals: 'bbb'.
	self assert: cred password equals: 'aaa'.	
]

{ #category : #'tests - storing' }
IceTipAskForPlaintextCredentialsModelTest >> testAcceptDoNotStoresCredential [

	| cred |
	dialog askingHostname: 'github.com'. 
	dialog openNonModal. 
	
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	dialog storeCheckbox state: false.
	
	dialog window triggerOkAction.

	cred := store plaintextCredentialForHostname: 'github.com'.
	self assert: cred username equals: ''.
	self assert: cred password equals: ''.		
]

{ #category : #tests }
IceTipAskForPlaintextCredentialsModelTest >> testAcceptEnabledAndDisabled [
	dialog askingHostname: 'github.com'.
	dialog openNonModal.
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	self assert: dialog okButton isEnabled.
	dialog passwordInput text: ''.
	dialog usernameInput text: 'bbb'.
	self deny: dialog okButton isEnabled.
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: ''.
	self deny: dialog okButton isEnabled.
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	self assert: dialog okButton isEnabled
]

{ #category : #tests }
IceTipAskForPlaintextCredentialsModelTest >> testAcceptIsBlockedInTheBeginning [
	dialog askingHostname: 'github.com'.
	dialog openNonModal.
	self deny: dialog okButton isEnabled
]

{ #category : #'tests - storing' }
IceTipAskForPlaintextCredentialsModelTest >> testAcceptStoresCredential [

	| cred |
	dialog askingHostname: 'github.com'. 
	dialog openNonModal. 
	
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	dialog storeCheckbox state: true.
	
	dialog window triggerOkAction.	

	cred := store plaintextCredentialForHostname: 'github.com'.
	self assert: cred username equals: 'bbb'.
	self assert: cred password equals: 'aaa'.		
]

{ #category : #'tests - storing' }
IceTipAskForPlaintextCredentialsModelTest >> testAcceptStoresCredentialReplacesOld [

	| cred orig |
	
	orig := IcePlaintextCredentials new.
	orig username: 'aUsername'.
	orig password: 'aPassword'.
	dialog askingHostname: 'github.com'. 
	dialog openNonModal. 
	
	dialog passwordInput text: 'aaa'.
	dialog usernameInput text: 'bbb'.
	
	dialog storeCheckbox state: true.
	
	dialog window triggerOkAction.	

	cred := store plaintextCredentialForHostname: 'github.com'.
	self assert: cred username equals: 'bbb'.
	self assert: cred password equals: 'aaa'.		
]

{ #category : #'tests - cancel' }
IceTipAskForPlaintextCredentialsModelTest >> testCancelThrowsException [

	dialog askingHostname: 'github.com'. 
	dialog openNonModal. 
	
	self should: [ dialog window triggerCancelAction ] raise: LGitNoCredentialsProvided
]

{ #category : #'tests - cancel' }
IceTipAskForPlaintextCredentialsModelTest >> testCloseThrowsException [

	dialog askingHostname: 'github.com'. 
	dialog openNonModal. 
	
	self should: [ dialog window close ] raise: LGitNoCredentialsProvided
]

{ #category : #tests }
IceTipAskForPlaintextCredentialsModelTest >> testTitle [

	dialog askingHostname: 'github.com'. 
	dialog openNonModal. 
	
	self assert: dialog titleForWindow equals: 'Please log in to github.com'.
]
