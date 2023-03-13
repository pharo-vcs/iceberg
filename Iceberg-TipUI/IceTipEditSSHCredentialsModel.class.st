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

	^ SpGridLayout new
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder
			add: publicKeyLabel; add: publicKeyInput; nextRow;
			add: privateKeyLabel; add: privateKeyInput; nextRow;
			add: passphraseLabel; add: passphraseInput; nextRow ];
		yourself
]

{ #category : #initialization }
IceTipEditSSHCredentialsModel >> initialExtentForWindow [

	^ (500@230) scaledByDisplayScaleFactor
]

{ #category : #actions }
IceTipEditSSHCredentialsModel >> refreshCredentialsFromPresenter [

	credentials
		publicKey: self publicKey;
		privateKey: self privateKey;
		keyPassphrase: self passphrase
]

{ #category : #actions }
IceTipEditSSHCredentialsModel >> refreshPresenterFromCredentials [

	passphraseInput text: credentials keyPassphrase.
	privateKeyInput location: credentials privateKey.
	publicKeyInput location: credentials publicKey
]

{ #category : #initialization }
IceTipEditSSHCredentialsModel >> titleForWindow [

	^ 'Edit SSH keys for ' , self credentials hostDescription
]
