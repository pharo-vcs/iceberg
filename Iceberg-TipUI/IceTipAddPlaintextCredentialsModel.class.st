"
I implement the dialog to add plaintext credentials.
"
Class {
	#name : #IceTipAddPlaintextCredentialsModel,
	#superclass : #IceTipAbstractPlaintextCredentialsModel,
	#instVars : [
		'hostLabel',
		'hostInput',
		'tool'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #specs }
IceTipAddPlaintextCredentialsModel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #hostLabel width: 80 * self currentWorld displayScaleFactor;
				add: #hostInput;
				yourself )
			height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #usernameLabel width: 80 * self currentWorld displayScaleFactor;
				add: #usernameInput;
				yourself )
			height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #passwordLabel width: 80 * self currentWorld displayScaleFactor;
				add: #passwordInput;
				yourself )
			height: self inputTextHeight;
		yourself
]

{ #category : #testing }
IceTipAddPlaintextCredentialsModel >> accept [
	credentialStore
		storeCredential: self credentials
		forHostname: self host.
	
	accepted := true.
	tool refresh
]

{ #category : #accessing }
IceTipAddPlaintextCredentialsModel >> host [
	^ self hostInput text
]

{ #category : #accessing }
IceTipAddPlaintextCredentialsModel >> hostInput [
	^ hostInput
]

{ #category : #accessing }
IceTipAddPlaintextCredentialsModel >> hostLabel [
	^ hostLabel
]

{ #category : #initialization }
IceTipAddPlaintextCredentialsModel >> initialExtent [
	^ (350 @ (self class inputTextHeight * 5 + self class buttonHeight)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAddPlaintextCredentialsModel >> initializeWidgets [
	super initializeWidgets.
	hostLabel := self newLabel label: 'Host: '.
	hostInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself
]

{ #category : #testing }
IceTipAddPlaintextCredentialsModel >> isOkEnabled [
	^ super isOkEnabled and: [ self host isNotEmpty ]
]

{ #category : #initialization }
IceTipAddPlaintextCredentialsModel >> putFocusOrder [
	self focusOrder
		add: hostInput;
		add: usernameInput;
		add: passwordInput;
		add: storeCheckbox
]

{ #category : #accessing }
IceTipAddPlaintextCredentialsModel >> title [
	^ 'Add new Plain Text Credential'
]

{ #category : #accessing }
IceTipAddPlaintextCredentialsModel >> tool: anObject [ 
	tool := anObject
]
