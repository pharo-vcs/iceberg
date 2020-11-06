"
I am a dialog to add token credentials.
"
Class {
	#name : #IceTipAddTokenCredentialsModel,
	#superclass : #IceTipAbstractAskCredentialsModel,
	#instVars : [
		'hostInput',
		'tokenInput',
		'tokenLabel',
		'hostLabel',
		'usernameInput',
		'usernameLabel',
		'tool'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #specs }
IceTipAddTokenCredentialsModel class >> defaultSpec [
	<spec: #default>

	^ SpecLayout composed newColumn: [ :col |
		col 
		 	newRow: [:row | row add: #usernameLabel width: 80 * self currentWorld displayScaleFactor; add: #usernameInput ] height: self inputTextHeight;
		 	newRow: [:row | row add: #hostLabel width: 80 * self currentWorld displayScaleFactor; add: #hostInput ] height: self inputTextHeight;
			newRow: [:row | row add: #tokenLabel width: 80 * self currentWorld displayScaleFactor; add: #tokenInput ] height: self inputTextHeight;
			newRow: [:row |]
	]

]

{ #category : #actions }
IceTipAddTokenCredentialsModel >> cancelAction [
	"Do nothing"
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> credentials [
	
	^ IceTokenCredentials new
		username: self usernameFromInput;
		token: self tokenFromInput;
		host: self hostnameFromInput;
		yourself 
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> hostInput [
	^ hostInput
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> hostLabel [
	^ hostLabel
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> hostnameFromInput [
	
	^ hostInput text
]

{ #category : #testing }
IceTipAddTokenCredentialsModel >> initialExtent [

	^ (350 @ (self class inputTextHeight * 5 + self class buttonHeight)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAddTokenCredentialsModel >> initializeWidgets [

	super initializeWidgets.
	usernameLabel := self newLabel label: 'Username: '.
	usernameInput := self newTextInput
		autoAccept: true;
		whenTextChanged: [ self updateOkButton ];
		yourself.
	hostLabel := self newLabel label: 'Host: '.
	hostInput := self newTextInput
		ghostText: 'e.g. github.com';
		autoAccept: true;
		whenTextChanged: [ self updateOkButton ];
		yourself.
	tokenLabel := self newLabel label: 'Token: '.
	tokenInput := self newTextInput
		beEncrypted;
		autoAccept: true;
		whenTextChanged: [ self updateOkButton ];
		yourself.

]

{ #category : #testing }
IceTipAddTokenCredentialsModel >> isOkEnabled [

	^ self usernameFromInput isNotEmpty and: [ 
		  self hostnameFromInput isNotEmpty and: [ 
			  self tokenFromInput isNotEmpty ] ]
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> okAction [

	credentialStore
		storeCredential: self credentials
		forHostname: self hostnameFromInput.

	accepted := true.
	tool refresh
]

{ #category : #initialization }
IceTipAddTokenCredentialsModel >> putFocusOrder [

	self focusOrder
		add: usernameInput;
		add: hostInput;
		add: tokenInput
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> title [

	^ 'Add token credentials'
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> tokenFromInput [
	
	^ tokenInput text
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> tokenInput [
	^ tokenInput
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> tokenLabel [
	^ tokenLabel
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> tool: anIceTipCredentialsStoreBrowser [
	tool := anIceTipCredentialsStoreBrowser
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> usernameFromInput [
	
	^ usernameInput text
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> usernameInput [
	^ usernameInput
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> usernameLabel [
	^ usernameLabel
]
