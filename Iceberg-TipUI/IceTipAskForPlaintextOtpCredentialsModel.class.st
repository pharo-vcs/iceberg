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
IceTipAskForPlaintextOtpCredentialsModel >> defaultLayout [

	^ SpBoxLayout newTopToBottom 
		borderWidth: 5;
		spacing: 5;
		add: (SpGridLayout new 
			borderWidth: 0;
			beColumnNotHomogeneous;
			column: 2 expand: true;
			build: [ :builder | builder
				add: usernameLabel; add: usernameInput; nextRow;
				add: passwordLabel; add: passwordInput; nextRow;
				add: tokenLabel; add: tokenInput; nextRow ]);
		add: storeCheckbox expand: false;
		yourself
]

{ #category : #initialization }
IceTipAskForPlaintextOtpCredentialsModel >> initialExtentForWindow [

	^ (350 @ 210) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAskForPlaintextOtpCredentialsModel >> initializePresenters [

	super initializePresenters.
	tokenLabel := self newLabel label: 'OTP Token: '.
	tokenInput := self newTextInput
		bePassword;
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
