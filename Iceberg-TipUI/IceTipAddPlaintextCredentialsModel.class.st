"
I implement the dialog to add plaintext credentials.
"
Class {
	#name : #IceTipAddPlaintextCredentialsModel,
	#superclass : #IceTipAbstractPlaintextCredentialsModel,
	#instVars : [
		'hostLabel',
		'hostInput'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #testing }
IceTipAddPlaintextCredentialsModel >> accept [

	self acceptAddAction
]

{ #category : #layout }
IceTipAddPlaintextCredentialsModel >> defaultLayout [

	^ SpGridLayout new 
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder 
			add: hostLabel; add: hostInput; nextRow;
			add: usernameLabel; add: usernameInput; nextRow;
			add: passwordLabel; add: passwordInput; nextRow ];
		yourself
]

{ #category : #accessing }
IceTipAddPlaintextCredentialsModel >> hostnameFromInput [

	^ hostInput text
]

{ #category : #initialization }
IceTipAddPlaintextCredentialsModel >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 5 + self class buttonHeight))
		  scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAddPlaintextCredentialsModel >> initializePresenters [

	super initializePresenters.
	hostLabel := self newLabel label: 'Host: '.
	hostInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself
]

{ #category : #testing }
IceTipAddPlaintextCredentialsModel >> isOkEnabled [

	^ super isOkEnabled and: [ self hostnameFromInput isNotEmpty ]
]

{ #category : #initialization }
IceTipAddPlaintextCredentialsModel >> titleForWindow [

	^ 'Add new Plain Text Credential'
]
