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

{ #category : #specs }
IceTipAddPlaintextCredentialsModel class >> defaultSpec [

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

	self acceptAddAction
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
