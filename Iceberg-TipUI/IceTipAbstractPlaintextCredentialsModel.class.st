"
I implement the basic behavior of all the plaintext credentials.
My subclasses implements the specific behavior for each of the operations.
"
Class {
	#name : #IceTipAbstractPlaintextCredentialsModel,
	#superclass : #IceTipAbstractCredentialsModel,
	#instVars : [
		'usernameLabel',
		'usernameInput',
		'passwordLabel',
		'passwordInput'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #initialization }
IceTipAbstractPlaintextCredentialsModel >> initializePresenters [

	super initializePresenters.
	usernameLabel := self newLabel label: 'Username: '.
	usernameInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.
	passwordLabel := self newLabel label: 'Password: '.
	passwordInput := self newTextInput
		bePassword;
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.

]

{ #category : #testing }
IceTipAbstractPlaintextCredentialsModel >> isOkEnabled [

	^ self username isNotEmpty and: [ self password isNotEmpty ]
]

{ #category : #accessing }
IceTipAbstractPlaintextCredentialsModel >> newCredentials [

	^ IcePlaintextCredentials new
		  username: self username;
		  password: self password;
		  yourself
]

{ #category : #accessing }
IceTipAbstractPlaintextCredentialsModel >> password [

	^ passwordInput text
]

{ #category : #'accessing ui' }
IceTipAbstractPlaintextCredentialsModel >> passwordInput [

	^ passwordInput
]

{ #category : #accessing }
IceTipAbstractPlaintextCredentialsModel >> username [

	^ usernameInput text
]

{ #category : #'accessing ui' }
IceTipAbstractPlaintextCredentialsModel >> usernameInput [

	^ usernameInput
]
