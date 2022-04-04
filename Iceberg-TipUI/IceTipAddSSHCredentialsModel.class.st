"
I implement the dialog to add SSH credentials.
"
Class {
	#name : #IceTipAddSSHCredentialsModel,
	#superclass : #IceTipAbstractSSHCredentialsModel,
	#instVars : [
		'hostLabel',
		'hostInput'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #actions }
IceTipAddSSHCredentialsModel >> accept [

	self acceptAddAction
]

{ #category : #layout }
IceTipAddSSHCredentialsModel >> defaultLayout [

	^ SpGridLayout build: [ :builder |
		builder
			borderWidth: 10;
			beColumnNotHomogeneous;
			column: 2 withConstraints: [ :c | c beExpand ];
		 	add: hostLabel; add: hostInput; nextRow;
		 	add: usernameLabel; add: usernameInput; nextRow;
			add: publicKeyInput label; add: publicKeyInput; nextRow;
			add: privateKeyInput label; add: privateKeyInput; nextRow;
			add: passphraseLabel; add: passphraseInput
	]
]

{ #category : #accessing }
IceTipAddSSHCredentialsModel >> hostnameFromInput [
	
	^ hostInput text
]

{ #category : #initialization }
IceTipAddSSHCredentialsModel >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 7 + self class buttonHeight))
		  scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAddSSHCredentialsModel >> initializePresenters [

	super initializePresenters.
	hostLabel := self newLabel
		label: 'Host: ';
		yourself.
	hostInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself
]

{ #category : #accessing }
IceTipAddSSHCredentialsModel >> newCredentials [
	
	^ IceSshCredentials new
		username: self username;
		publicKey: self publicKey;
		privateKey: self privateKey;
		keyPassphrase: self passphrase;
		yourself 
]

{ #category : #initialization }
IceTipAddSSHCredentialsModel >> titleForWindow [

	^ 'Add SSH credential'
]
