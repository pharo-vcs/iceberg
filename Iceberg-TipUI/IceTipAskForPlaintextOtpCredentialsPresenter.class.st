Class {
	#name : 'IceTipAskForPlaintextOtpCredentialsPresenter',
	#superclass : 'IceTipAskForPlaintextCredentialsPresenter',
	#instVars : [
		'tokenLabel',
		'tokenInput'
	],
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'layout' }
IceTipAskForPlaintextOtpCredentialsPresenter >> defaultLayout [

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

{ #category : 'initialization' }
IceTipAskForPlaintextOtpCredentialsPresenter >> initialExtentForWindow [

	^ (350 @ 210) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipAskForPlaintextOtpCredentialsPresenter >> initializePresenters [

	super initializePresenters.
	tokenLabel := self newLabel label: 'OTP Token: '.
	tokenInput := self newTextInput
		bePassword;
		whenTextChangedDo: [ self updateOkButton ];
		yourself
]

{ #category : 'accessing' }
IceTipAskForPlaintextOtpCredentialsPresenter >> newCredentials [

	^ IcePlaintextOtpCredentials new
		  username: self username;
		  password: self password;
		  token: self token;
		  yourself
]

{ #category : 'accessing' }
IceTipAskForPlaintextOtpCredentialsPresenter >> token [

	^ tokenInput text
]
