"
I implement the basic behavior of all the ssh credentials.
My subclasses implements the specific behavior for each of the operations.
"
Class {
	#name : #IceTipAbstractSSHCredentialsModel,
	#superclass : #IceTipAbstractCredentialsModel,
	#instVars : [
		'publicKeyInput',
		'privateKeyInput',
		'passphraseInput',
		'passphraseLabel',
		'publicKeyLabel',
		'privateKeyLabel'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #initialization }
IceTipAbstractSSHCredentialsModel >> initializePresenters [

	super initializePresenters.
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
		yourself
]

{ #category : #testing }
IceTipAbstractSSHCredentialsModel >> isOkEnabled [

	^ self publicKey isNotEmpty and: [ self privateKey isNotEmpty ]
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
