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

{ #category : #specs }
IceTipAddTokenCredentialsModel class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: #usernameLabel width: self labelWidth;
				   add: #usernameInput;
				   yourself)
		  height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #hostLabel width: self labelWidth;
				   add: #hostInput;
				   yourself)
		  height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #tokenLabel width: self labelWidth;
				   add: #tokenInput;
				   yourself)
		  height: self inputTextHeight;
		  yourself
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> accept [

	self acceptAddAction
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

{ #category : #accessing }
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
