"
I implement the dialog to edit SSH credentials.
"
Class {
	#name : #IceTipEditSSHCredentialsModel,
	#superclass : #IceTipAbstractSSHCredentialsModel,
	#instVars : [
		'credentials'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #specs }
IceTipEditSSHCredentialsModel class >> defaultSpec [
	<spec: #default>

	^ SpBoxLayout newVertical 
		 	 add: (SpBoxLayout  newHorizontal add: #usernameLabel width: self labelWidth ; add: #usernameInput ) height: self inputTextHeight;
			add: #publicKeyInput height: self inputTextHeight;
			add: #privateKeyInput  height: self inputTextHeight;
			add:( SpBoxLayout newHorizontal add: #passphraseLabel width: self labelWidth; add: #passphraseInput) height: self inputTextHeight
		

]

{ #category : #actions }
IceTipEditSSHCredentialsModel >> accept [
	self credentials
		username: self username;
		publicKey: self publicKey;
		privateKey: self privateKey;
		keyPassphrase: self passphrase.
	credentialStore storeCredential: self credentials.
	tool ifNotNil: #refresh.
	accepted := true.
	^ self credentials
]

{ #category : #actions }
IceTipEditSSHCredentialsModel >> cancelAction [
	"I do nothing"
]

{ #category : #accessing }
IceTipEditSSHCredentialsModel >> credentials [
	^ credentials
]

{ #category : #accessing }
IceTipEditSSHCredentialsModel >> credentials: aValue [
	credentials := aValue.
	usernameInput text: credentials username.
	passphraseInput text: credentials keyPassphrase.
	privateKeyInput location: credentials privateKey.
	publicKeyInput location: credentials publicKey
]

{ #category : #api }
IceTipEditSSHCredentialsModel >> initialExtent [

	^ (350 @ (self class inputTextHeight * 6 + self class buttonHeight)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipEditSSHCredentialsModel >> putFocusOrder [
	self focusOrder
		add: usernameInput;
		add: publicKeyInput locationInput;
		add: privateKeyInput locationInput;
		add: passphraseInput;
		add: storeCheckbox
]

{ #category : #api }
IceTipEditSSHCredentialsModel >> title [
	^ 'Edit SSH keys for ' , self credentials hostDescription
]
