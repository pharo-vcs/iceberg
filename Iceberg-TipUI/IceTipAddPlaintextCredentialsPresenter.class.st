"
I implement the dialog to add plaintext credentials.
"
Class {
	#name : 'IceTipAddPlaintextCredentialsPresenter',
	#superclass : 'IceTipAbstractPlaintextCredentialsPresenter',
	#instVars : [
		'hostLabel',
		'hostInput'
	],
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'testing' }
IceTipAddPlaintextCredentialsPresenter >> accept [

	self acceptAddAction
]

{ #category : 'layout' }
IceTipAddPlaintextCredentialsPresenter >> defaultLayout [

	^ SpGridLayout new 
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder 
			add: hostLabel; add: hostInput; nextRow;
			add: usernameLabel; add: usernameInput; nextRow;
			add: passwordLabel; add: passwordInput; nextRow ];
		yourself
]

{ #category : 'accessing' }
IceTipAddPlaintextCredentialsPresenter >> hostnameFromInput [

	^ hostInput text
]

{ #category : 'initialization' }
IceTipAddPlaintextCredentialsPresenter >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 5 + self class buttonHeight))
		  scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipAddPlaintextCredentialsPresenter >> initializePresenters [

	super initializePresenters.
	hostLabel := self newLabel label: 'Host: '.
	hostInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself
]

{ #category : 'testing' }
IceTipAddPlaintextCredentialsPresenter >> isOkEnabled [

	^ super isOkEnabled and: [ self hostnameFromInput isNotEmpty ]
]

{ #category : 'initialization' }
IceTipAddPlaintextCredentialsPresenter >> titleForWindow [

	^ 'Add new Plain Text Credential'
]
