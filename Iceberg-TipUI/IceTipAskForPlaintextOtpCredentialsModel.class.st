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
	<spec: #default>

	^ SpecLayout composed newColumn: [ :col |
		col 
		 	newRow: [:row | row add: #usernameLabel width: 80 * self currentWorld displayScaleFactor; add: #usernameInput ] height: self inputTextHeight;
			newRow: [:row | row add: #passwordLabel width: 80 * self currentWorld  displayScaleFactor; add: #passwordInput ] height: self inputTextHeight;
			newRow: [:row | row add: #tokenLabel width: 80 * self currentWorld displayScaleFactor; add: #tokenInput ] height: self inputTextHeight;
			add: #storeCheckbox height: self inputTextHeight.
	]

]

{ #category : #api }
IceTipAskForPlaintextOtpCredentialsModel >> initialExtent [
	^ (350 @ (self class inputTextHeight * 6 + self class buttonHeight)) scaledByDisplayScaleFactor
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

{ #category : #initialization }
IceTipAskForPlaintextOtpCredentialsModel >> putFocusOrder [
	self focusOrder
		add: usernameInput;
		add: passwordInput;
		add: tokenInput;
		add: storeCheckbox
]

{ #category : #accessing }
IceTipAskForPlaintextOtpCredentialsModel >> token [
	^ tokenInput text
]
