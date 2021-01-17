Class {
	#name : #IceTipAskForPlaintextOtpCredentialsModel,
	#superclass : #IceTipAskForPlaintextCredentialsModel,
	#instVars : [
		'tokenLabel',
		'tokenInput'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #specs }
IceTipAskForPlaintextOtpCredentialsModel class >> defaultSpec [

	^ SpBoxLayout newVertical
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
		add:
			(SpBoxLayout newHorizontal
				add: #tokenLabel width: 80 * self currentWorld displayScaleFactor;
				add: #tokenInput;
				yourself )
			height: self inputTextHeight;
		add: #storeCheckbox height: self inputTextHeight

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
