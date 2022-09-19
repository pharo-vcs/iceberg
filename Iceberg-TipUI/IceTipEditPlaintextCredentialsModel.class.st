"
I implement the dialog to edit plaintext credentials.
"
Class {
	#name : #IceTipEditPlaintextCredentialsModel,
	#superclass : #IceTipAbstractPlaintextCredentialsModel,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #actions }
IceTipEditPlaintextCredentialsModel >> accept [ 
	
	^ self acceptEditAction
]

{ #category : #layout }
IceTipEditPlaintextCredentialsModel >> defaultLayout [

	^ SpGridLayout new 
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder
			add: usernameLabel; add: usernameInput; nextRow;
			add: passwordLabel; add: passwordInput; nextRow ];
		yourself
]

{ #category : #initialization }
IceTipEditPlaintextCredentialsModel >> initialExtentForWindow [

	^ (350 @ 160) scaledByDisplayScaleFactor
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
