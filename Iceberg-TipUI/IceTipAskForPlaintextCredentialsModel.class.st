"
I implement the dialog to ask plaintext credentials.
This dialog is used when the IceTipInteractiveCredentialsProvider needs to ask a plaintext credential.
"
Class {
	#name : #IceTipAskForPlaintextCredentialsModel,
	#superclass : #IceTipAbstractPlaintextCredentialsModel,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #layout }
IceTipAskForPlaintextCredentialsModel class >> defaultLayout [

	^ SpGridLayout build: [ :builder |
		builder
			borderWidth: 10;
			beColumnNotHomogeneous;
			column: 2 withConstraints: [ :c | c beExpand ];
			add: #usernameLabel; add: #usernameInput; nextRow;
			add: #passwordLabel; add: #passwordInput; nextRow;
		 	add: #storeCheckbox
		 ]
	

]

{ #category : #actions }
IceTipAskForPlaintextCredentialsModel >> accept [

	^ self acceptAskAction
]

{ #category : #actions }
IceTipAskForPlaintextCredentialsModel >> cancel [

	self cancelAskAction
]

{ #category : #actions }
IceTipAskForPlaintextCredentialsModel >> cancelAction [

	self cancelAskAction
]

{ #category : #initialization }
IceTipAskForPlaintextCredentialsModel >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 5 + self class buttonHeight))
		  scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAskForPlaintextCredentialsModel >> titleForWindow [

	^ 'Please log in to ' , askingHostname
]
