Class {
	#name : #IceTipAskForPlaintextOtpCredentialsModel,
	#superclass : #IceTipAskForPlaintextCredentialsModel,
	#instVars : [
		'tokenLabel',
		'tokenInput'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #layout }
IceTipAskForPlaintextOtpCredentialsModel class >> defaultLayout [

	^ SpGridLayout build: [ :builder |
		builder
			borderWidth: 10;
			beColumnNotHomogeneous;
			column: 2 withConstraints: [ :c | c beExpand ];
			add: #usernameLabel; add: #usernameInput; nextRow;
			add: #passwordLabel; add: #passwordInput; nextRow;
			add: #tokenLabel; add: #tokenInput; nextRow;
			add: #storeCheckbox
		 ]
]

{ #category : #initialization }
IceTipAskForPlaintextOtpCredentialsModel >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 6 + self class buttonHeight))
		  scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAskForPlaintextOtpCredentialsModel >> initializePresenters [

	super initializePresenters.
	tokenLabel := self newLabel label: 'OTP Token: '.
	tokenInput := self newTextInput
		bePassword;
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself
]

{ #category : #accessing }
IceTipAskForPlaintextOtpCredentialsModel >> newCredentials [

	^ IcePlaintextOtpCredentials new
		  username: self username;
		  password: self password;
		  token: self token;
		  yourself
]

{ #category : #accessing }
IceTipAskForPlaintextOtpCredentialsModel >> token [

	^ tokenInput text
]
