"
I implement the basic behavior of all the ssh credentials.
My subclasses implements the specific behavior for each of the operations.
"
Class {
	#name : 'IceTipAbstractSSHCredentialsPresenter',
	#superclass : 'IceTipAbstractCredentialsPresenter',
	#instVars : [
		'usernameInput',
		'usernameLabel',
		'publicKeyInput',
		'privateKeyInput',
		'passphraseInput',
		'passphraseLabel',
		'publicKeyLabel',
		'privateKeyLabel'
	],
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'initialization' }
IceTipAbstractSSHCredentialsPresenter >> initializePresenters [

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
	privateKeyLabel := self newLabel
		label: 'Private Key';
		yourself.
	privateKeyInput := IceTipFilePresenter new
		onChoose: [ self updateOkButton ];
		chooseTitle: 'Select Private Key';
		whenTextChanged: [ self updateOkButton ];
		yourself.
	publicKeyLabel := self newLabel
		label: 'Public Key';
		yourself.
	publicKeyInput := IceTipFilePresenter new
		onChoose: [ self updateOkButton ];
		chooseTitle: 'Select Public Key';
		whenTextChanged: [ self updateOkButton ];
		yourself.

]

{ #category : 'testing' }
IceTipAbstractSSHCredentialsPresenter >> isOkEnabled [

	^ self username isNotEmpty and: [ 
		  self publicKey isNotEmpty and: [ self privateKey isNotEmpty ] ]
]

{ #category : 'accessing' }
IceTipAbstractSSHCredentialsPresenter >> passphrase [

	^ passphraseInput text
]

{ #category : 'accessing' }
IceTipAbstractSSHCredentialsPresenter >> privateKey [

	^ privateKeyInput location
		  ifNil: [ '' ]
		  ifNotNil: [ :x | x pathString ]
]

{ #category : 'accessing' }
IceTipAbstractSSHCredentialsPresenter >> publicKey [

	^ publicKeyInput location
		  ifNil: [ '' ]
		  ifNotNil: [ :x | x pathString ]
]

{ #category : 'accessing' }
IceTipAbstractSSHCredentialsPresenter >> username [

	^ usernameInput text
]
