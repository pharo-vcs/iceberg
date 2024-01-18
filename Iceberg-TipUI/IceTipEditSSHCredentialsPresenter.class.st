"
I implement the dialog to edit SSH credentials.
"
Class {
	#name : 'IceTipEditSSHCredentialsPresenter',
	#superclass : 'IceTipAbstractSSHCredentialsPresenter',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'actions' }
IceTipEditSSHCredentialsPresenter >> accept [

	^ self acceptEditAction
]

{ #category : 'layout' }
IceTipEditSSHCredentialsPresenter >> defaultLayout [

	^ SpGridLayout new 
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder 
			add: usernameLabel; add: usernameInput; nextRow; 
			add: publicKeyLabel; add: publicKeyInput; nextRow; 
			add: privateKeyLabel; add: privateKeyInput; nextRow;
			add: passphraseLabel; add: passphraseInput; nextRow ];
		yourself
]

{ #category : 'initialization' }
IceTipEditSSHCredentialsPresenter >> initialExtentForWindow [

	^ (500@230) scaledByDisplayScaleFactor
]

{ #category : 'actions' }
IceTipEditSSHCredentialsPresenter >> refreshCredentialsFromPresenter [

	credentials
		username: self username;
		publicKey: self publicKey;
		privateKey: self privateKey;
		keyPassphrase: self passphrase
]

{ #category : 'accessing' }
IceTipEditSSHCredentialsPresenter >> refreshPresenterFromCredentials [

	usernameInput text: credentials username.
	passphraseInput text: credentials keyPassphrase.
	privateKeyInput location: credentials privateKey.
	publicKeyInput location: credentials publicKey
]

{ #category : 'initialization' }
IceTipEditSSHCredentialsPresenter >> titleForWindow [

	^ 'Edit SSH keys for ' , self credentials hostDescription
]
