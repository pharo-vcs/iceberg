"
I implement the basic behavior of all the plaintext credentials.
My subclasses implements the specific behavior for each of the operations.
"
Class {
	#name : 'IceTipAbstractPlaintextCredentialsPresenter',
	#superclass : 'IceTipAbstractCredentialsPresenter',
	#instVars : [
		'usernameLabel',
		'usernameInput',
		'passwordLabel',
		'passwordInput'
	],
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'initialization' }
IceTipAbstractPlaintextCredentialsPresenter >> initializePresenters [

	super initializePresenters.
	usernameLabel := self newLabel label: 'Username:'.
	usernameInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.
	passwordLabel := self newLabel label: self passwordLabel.
	passwordInput := self newTextInput
		bePassword;
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.

]

{ #category : 'testing' }
IceTipAbstractPlaintextCredentialsPresenter >> isOkEnabled [

	^ self username isNotEmpty and: [ self password isNotEmpty ]
]

{ #category : 'accessing' }
IceTipAbstractPlaintextCredentialsPresenter >> newCredentials [

	^ IcePlaintextCredentials new
		  username: self username;
		  password: self password;
		  yourself
]

{ #category : 'accessing' }
IceTipAbstractPlaintextCredentialsPresenter >> password [

	^ passwordInput text
]

{ #category : 'accessing - ui' }
IceTipAbstractPlaintextCredentialsPresenter >> passwordInput [

	^ passwordInput
]

{ #category : 'private' }
IceTipAbstractPlaintextCredentialsPresenter >> passwordLabel [

	^ 'Password:'
]

{ #category : 'accessing' }
IceTipAbstractPlaintextCredentialsPresenter >> username [

	^ usernameInput text
]

{ #category : 'accessing - ui' }
IceTipAbstractPlaintextCredentialsPresenter >> usernameInput [

	^ usernameInput
]
