"
I implement the dialog to add SSH credentials.
"
Class {
	#name : 'IceTipAddSSHCredentialsPresenter',
	#superclass : 'IceTipAbstractSSHCredentialsPresenter',
	#instVars : [
		'hostLabel',
		'hostInput'
	],
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'actions' }
IceTipAddSSHCredentialsPresenter >> accept [

	self acceptAddAction
]

{ #category : 'layout' }
IceTipAddSSHCredentialsPresenter >> defaultLayout [

	^ SpGridLayout new
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder
			add: hostLabel; add: hostInput; nextRow;
			add: usernameLabel; add: usernameInput; nextRow;
			add: publicKeyLabel; add: publicKeyInput; nextRow;
			add: privateKeyLabel; add: privateKeyInput; nextRow;
			add: passphraseLabel; add: passphraseInput; nextRow ]
]

{ #category : 'accessing' }
IceTipAddSSHCredentialsPresenter >> hostnameFromInput [
	
	^ hostInput text
]

{ #category : 'initialization' }
IceTipAddSSHCredentialsPresenter >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 7 + self class buttonHeight))
		  scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipAddSSHCredentialsPresenter >> initializePresenters [

	super initializePresenters.
	hostLabel := self newLabel
		label: 'Host: ';
		yourself.
	hostInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself
]

{ #category : 'accessing' }
IceTipAddSSHCredentialsPresenter >> newCredentials [
	
	^ IceSshCredentials new
		username: self username;
		publicKey: self publicKey;
		privateKey: self privateKey;
		keyPassphrase: self passphrase;
		yourself 
]

{ #category : 'initialization' }
IceTipAddSSHCredentialsPresenter >> titleForWindow [

	^ 'Add SSH credential'
]
