"
I implement the dialog to edit SSH credentials.
"
Class {
	#name : #IceTipEditSSHCredentialsModel,
	#superclass : #IceTipAbstractSSHCredentialsModel,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #actions }
IceTipEditSSHCredentialsModel >> accept [

	^ self acceptEditAction
]

{ #category : #layout }
IceTipEditSSHCredentialsModel >> defaultLayout [

	^ SpGridLayout build: [ :builder |
		builder
			beColumnNotHomogeneous;
			column: 2 withConstraints: [ :c | c beExpand ];
		 	add: usernameLabel; add: usernameInput;
			nextRow;
			add: publicKeyInput label; add: publicKeyInput;
			nextRow;
			add: privateKeyInput label; add: privateKeyInput;
			nextRow;
			add: passphraseLabel; add: passphraseInput
	]
]

{ #category : #initialization }
IceTipEditSSHCredentialsModel >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 6 + self class buttonHeight)) scaledByDisplayScaleFactor
]

{ #category : #actions }
IceTipEditSSHCredentialsModel >> refreshCredentialsFromPresenter [

	credentials
		username: self username;
		publicKey: self publicKey;
		privateKey: self privateKey;
		keyPassphrase: self passphrase
]

{ #category : #accessing }
IceTipEditSSHCredentialsModel >> refreshPresenterFromCredentials [

	usernameInput text: credentials username.
	passphraseInput text: credentials keyPassphrase.
	privateKeyInput location: credentials privateKey.
	publicKeyInput location: credentials publicKey
]

{ #category : #initialization }
IceTipEditSSHCredentialsModel >> titleForWindow [

	^ 'Edit SSH keys for ' , self credentials hostDescription
]
