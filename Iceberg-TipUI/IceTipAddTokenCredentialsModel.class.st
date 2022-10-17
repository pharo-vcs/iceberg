"
I am a dialog to add token credentials.
"
Class {
	#name : #IceTipAddTokenCredentialsModel,
	#superclass : #IceTipAbstractCredentialsModel,
	#instVars : [
		'hostInput',
		'tokenInput',
		'tokenLabel',
		'hostLabel',
		'usernameInput',
		'usernameLabel'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> accept [

	self acceptAddAction
]

{ #category : #layout }
IceTipAddTokenCredentialsModel >> defaultLayout [

	^ SpGridLayout new 
		borderWidth: 5;
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder
			add: usernameLabel; add: usernameInput; nextRow;
			add: hostLabel; add: hostInput; nextRow;
			add: tokenLabel; add: tokenInput; nextRow ];
		yourself

]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> hostnameFromInput [
	
	^ hostInput text
]

{ #category : #initialization }
IceTipAddTokenCredentialsModel >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 5 + self class buttonHeight)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAddTokenCredentialsModel >> initializePresenters [

	super initializePresenters.
	usernameLabel := self newLabel
		label: 'Username: ';
		yourself.
	usernameInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.

	hostLabel := self newLabel
		label: 'Host: ';
		yourself.
	hostInput := self newTextInput
		placeholder: 'github.com';
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.

	tokenLabel := self newLabel
		label: 'Token: ';
		yourself.
	tokenInput := self newTextInput
		bePassword;
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.

]

{ #category : #testing }
IceTipAddTokenCredentialsModel >> isOkEnabled [

	^ self usernameFromInput isNotEmpty and: [ 
		  self hostnameFromInput isNotEmpty and: [ 
			  self tokenFromInput isNotEmpty ] ]
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> newCredentials [
	
	^ IceTokenCredentials new
		username: self usernameFromInput;
		token: self tokenFromInput;
		host: self hostnameFromInput;
		yourself 
]

{ #category : #initialization }
IceTipAddTokenCredentialsModel >> titleForWindow [

	^ 'Add token credentials'
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> tokenFromInput [
	
	^ tokenInput text
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> usernameFromInput [
	
	^ usernameInput text
]
