"
I implement the dialog to ask plaintext credentials.
This dialog is used when the IceTipInteractiveCredentialsProvider needs to ask a plaintext credential.
"
Class {
	#name : #IceTipAskForPlaintextCredentialsModel,
	#superclass : #IceTipAbstractPlaintextCredentialsModel,
	#category : #'Iceberg-TipUI-Credentials'
}

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

{ #category : #layout }
IceTipAskForPlaintextCredentialsModel >> defaultLayout [

	^ SpBoxLayout newTopToBottom 
		borderWidth: 5;
		spacing: 5;
		add: (SpGridLayout new 
			borderWidth: 0;
			beColumnNotHomogeneous;
			column: 2 expand: true;
			build: [ :builder | builder
				add: usernameLabel; add: usernameInput; nextRow;
				add: passwordLabel; add: passwordInput; nextRow ]);
		add: storeCheckbox expand: false;
		yourself

]

{ #category : #initialization }
IceTipAskForPlaintextCredentialsModel >> initialExtentForWindow [

	^ (450 @ 180) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAskForPlaintextCredentialsModel >> titleForWindow [

	^ 'Please log in to ' , askingHostname
]
