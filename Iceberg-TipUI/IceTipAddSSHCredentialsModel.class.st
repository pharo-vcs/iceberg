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

{ #category : #specs }
IceTipAddSSHCredentialsModel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #hostLabel width: self labelWidth;
				add: #hostInput;
				yourself)
			height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #usernameLabel width: self labelWidth;
				add: #usernameInput;
				yourself)
			height: self inputTextHeight;
		add: #publicKeyInput height: self inputTextHeight;
		add: #privateKeyInput height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #passphraseLabel width: self labelWidth;
				add: #passphraseInput;
				yourself )
			height: self inputTextHeight
]

{ #category : #actions }
IceTipAddSSHCredentialsModel >> accept [
	credentialStore
		storeCredential: self credentials
		forHostname: self host.
	tool refresh
]

{ #category : #actions }
IceTipAddSSHCredentialsModel >> cancelAction [
	" I do nothing on cancel "
]

{ #category : #accessing }
IceTipAddSSHCredentialsModel >> credentials [
	
	^ IceSshCredentials new
		username: self username;
		publicKey: self publicKey;
		privateKey: self privateKey;
		keyPassphrase: self passphrase;
		yourself 
]

{ #category : #accessing }
IceTipAddSSHCredentialsModel >> host [
	
	^ self hostInput text
]

{ #category : #accessing }
IceTipAddSSHCredentialsModel >> hostInput [
	^ hostInput
]

{ #category : #accessing }
IceTipAddSSHCredentialsModel >> hostLabel [
	^ hostLabel
]

{ #category : #api }
IceTipAddSSHCredentialsModel >> initialExtent [
	^ (350 @ (self class inputTextHeight * 7 + self class buttonHeight)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAddSSHCredentialsModel >> initializeWidgets [
	super initializeWidgets.
	hostLabel := self newLabel label: 'Host: '.
	hostInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself
]

{ #category : #initialization }
IceTipAddSSHCredentialsModel >> putFocusOrder [
	self focusOrder
		add: hostInput;
		add: usernameInput;
		add: publicKeyInput locationInput;
		add: privateKeyInput locationInput;
		add: passphraseInput;
		add: storeCheckbox
]

{ #category : #api }
IceTipAddSSHCredentialsModel >> title [

	^ 'Add SSH credential'
]
