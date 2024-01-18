"
I implement the dialog to ask plaintext credentials.
This dialog is used when the IceTipInteractiveCredentialsProvider needs to ask a plaintext credential.
"
Class {
	#name : 'IceTipAskForPlaintextCredentialsPresenter',
	#superclass : 'IceTipAbstractPlaintextCredentialsPresenter',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'actions' }
IceTipAskForPlaintextCredentialsPresenter >> accept [

	^ self acceptAskAction
]

{ #category : 'actions' }
IceTipAskForPlaintextCredentialsPresenter >> cancel [

	self cancelAskAction
]

{ #category : 'actions' }
IceTipAskForPlaintextCredentialsPresenter >> cancelAction [

	self cancelAskAction
]

{ #category : 'layout' }
IceTipAskForPlaintextCredentialsPresenter >> defaultLayout [

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

{ #category : 'initialization' }
IceTipAskForPlaintextCredentialsPresenter >> initialExtentForWindow [

	^ (450 @ 180) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipAskForPlaintextCredentialsPresenter >> titleForWindow [

	^ 'Please log in to ' , askingHostname
]
