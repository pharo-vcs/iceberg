"
I am a dialog to add token credentials.
"
Class {
	#name : 'IceTipAddTokenCredentialsPresenter',
	#superclass : 'IceTipAbstractCredentialsPresenter',
	#instVars : [
		'hostInput',
		'tokenInput',
		'tokenLabel',
		'hostLabel',
		'usernameInput',
		'usernameLabel'
	],
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'accessing' }
IceTipAddTokenCredentialsPresenter >> accept [

	self acceptAddAction
]

{ #category : 'layout' }
IceTipAddTokenCredentialsPresenter >> defaultLayout [

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

{ #category : 'accessing' }
IceTipAddTokenCredentialsPresenter >> hostnameFromInput [
	
	^ hostInput text
]

{ #category : 'initialization' }
IceTipAddTokenCredentialsPresenter >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 5 + self class buttonHeight)) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipAddTokenCredentialsPresenter >> initializePresenters [

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

{ #category : 'testing' }
IceTipAddTokenCredentialsPresenter >> isOkEnabled [

	^ self usernameFromInput isNotEmpty and: [ 
		  self hostnameFromInput isNotEmpty and: [ 
			  self tokenFromInput isNotEmpty ] ]
]

{ #category : 'accessing' }
IceTipAddTokenCredentialsPresenter >> newCredentials [
	
	^ IceTokenCredentials new
		username: self usernameFromInput;
		token: self tokenFromInput;
		host: self hostnameFromInput;
		yourself 
]

{ #category : 'initialization' }
IceTipAddTokenCredentialsPresenter >> titleForWindow [

	^ 'Add token credentials'
]

{ #category : 'accessing' }
IceTipAddTokenCredentialsPresenter >> tokenFromInput [
	
	^ tokenInput text
]

{ #category : 'accessing' }
IceTipAddTokenCredentialsPresenter >> usernameFromInput [
	
	^ usernameInput text
]
