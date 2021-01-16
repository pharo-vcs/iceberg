"
I implement the basic behavior of all the ssh credentials.
My subclasses implements the specific behavior for each of the operations.
"
Class {
	#name : #IceTipAbstractSSHCredentialsModel,
	#superclass : #IceTipAbstractCredentialsModel,
	#instVars : [
		'usernameInput',
		'usernameLabel',
		'publicKeyInput',
		'privateKeyInput',
		'passphraseInput',
		'passphraseLabel'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #initialization }
IceTipAbstractSSHCredentialsModel >> initializePresenters [

	super initializePresenters.
	usernameLabel := self newLabel
		label: 'Username: ';
		yourself.
	usernameInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.
	passphraseLabel := self newLabel
		label: 'Key Passphrase: ';
		yourself.
	passphraseInput := self newTextInput
		bePassword;
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.
	privateKeyInput := IceTipFilePresenter new
		label: 'Private Key';
		onChoose: [ self updateOkButton ];
		chooseTitle: 'Select Private Key';
		whenTextChanged: [ self updateOkButton ];
		yourself.
	publicKeyInput := IceTipFilePresenter new
		label: 'Public Key';
		onChoose: [ self updateOkButton ];
		chooseTitle: 'Select Public Key';
		whenTextChanged: [ self updateOkButton ];
		yourself.

]

{ #category : #testing }
IceTipAbstractSSHCredentialsModel >> isOkEnabled [

	^ self username isNotEmpty and: [ 
		  self publicKey isNotEmpty and: [ self privateKey isNotEmpty ] ]
]

{ #category : #accessing }
IceTipAbstractSSHCredentialsModel >> passphrase [

	^ passphraseInput text
]

{ #category : #accessing }
IceTipAbstractSSHCredentialsModel >> privateKey [

	^ privateKeyInput location
		  ifNil: [ '' ]
		  ifNotNil: [ :x | x pathString ]
]

{ #category : #accessing }
IceTipAbstractSSHCredentialsModel >> publicKey [

	^ publicKeyInput location
		  ifNil: [ '' ]
		  ifNotNil: [ :x | x pathString ]
]

{ #category : #accessing }
IceTipAbstractSSHCredentialsModel >> username [

	^ usernameInput text
]
