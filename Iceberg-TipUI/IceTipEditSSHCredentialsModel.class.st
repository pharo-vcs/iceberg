"
I implement the dialog to edit SSH credentials.
"
Class {
	#name : #IceTipEditSSHCredentialsModel,
	#superclass : #IceTipAbstractSSHCredentialsModel,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #specs }
IceTipEditSSHCredentialsModel class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: #usernameLabel width: self labelWidth;
				   add: #usernameInput;
				   yourself)
		  height: self inputTextHeight;
		  add: #publicKeyInput height: self inputTextHeight;
		  add: #privateKeyInput height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #passphraseLabel width: self labelWidth;
				   add: #passphraseInput;
				   yourself)
		  height: self inputTextHeight
]

{ #category : #actions }
IceTipEditSSHCredentialsModel >> accept [

	^ self acceptEditAction
]

{ #category : #api }
IceTipEditSSHCredentialsModel >> initialExtent [

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

{ #category : #api }
IceTipEditSSHCredentialsModel >> titleForWindow [

	^ 'Edit SSH keys for ' , self credentials hostDescription
]
