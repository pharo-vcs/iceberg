"
I implement the dialog to edit plaintext credentials.
"
Class {
	#name : #IceTipEditPlaintextCredentialsModel,
	#superclass : #IceTipAbstractPlaintextCredentialsModel,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #layout }
IceTipEditPlaintextCredentialsModel class >> defaultLayout [

	^ SpGridLayout build: [ :builder |
		builder
			borderWidth: 10;
			beColumnNotHomogeneous;
			column: 2 withConstraints: [ :c | c beExpand ];
			add: #usernameLabel; add: #usernameInput; nextRow;
			add: #passwordLabel; add: #passwordInput; nextRow
		 ]

]

{ #category : #actions }
IceTipEditPlaintextCredentialsModel >> accept [ 
	
	^ self acceptEditAction
]

{ #category : #initialization }
IceTipEditPlaintextCredentialsModel >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 4 + self class buttonHeight))
		  scaledByDisplayScaleFactor
]

{ #category : #actions }
IceTipEditPlaintextCredentialsModel >> refreshCredentialsFromPresenter [

	credentials
		username: self username;
		password: self password
]

{ #category : #accessing }
IceTipEditPlaintextCredentialsModel >> refreshPresenterFromCredentials [

	usernameInput text: credentials username.
	passwordInput text: credentials password
]

{ #category : #initialization }
IceTipEditPlaintextCredentialsModel >> titleForWindow [

	^ 'Edit credential for ' , credentials host
]
